import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';
import 'package:whatsupp/model/users.dart';
import 'package:whatsupp/connexion.dart';

class draweracceuil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return draweracceuilState();
  }
}

class draweracceuilState extends State<draweracceuil> {
  late users myProfil;
  String? namefile;
  String? urlfile;
  Uint8List? bytesFile;
  @override
  Widget build(BuildContext context) {
    popupimage() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Souhaitez vous enregistrer cette image ?"),
              content: Image.memory(
                bytesFile!,
                width: 250,
                height: 250,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firebaseHelp()
                          .stockImage(namefile!, bytesFile!)
                          .then((String url) {
                        setState(() {
                          urlfile = url;
                        });
                        Map<String, dynamic> map = {"AVATAR": urlfile};
                        firebaseHelp().updatedUser(myProfil.id, map);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text(
                      "Enregistrement",
                      style: TextStyle(fontFamily: "GameOfSquids"),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Annuler",
                      style: TextStyle(fontFamily: "GameOfSquids"),
                    )),
              ],
            );
          });
    }

    firebaseHelp().getIdentifiant().then((String idofme) {
      firebaseHelp().getUtilisateur(idofme).then((users monuser) {
        setState(() {
          myProfil = monuser;
        });
      });
    });

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          InkWell(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: (myProfil.avatar == null)
                          ? const NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')
                          : NetworkImage(myProfil.avatar!))),
            ),
            onTap: () async {
              FilePickerResult? resultat = await FilePicker.platform
                  .pickFiles(withData: true, type: FileType.image);
              if (resultat != null) {
                setState(() {
                  namefile = resultat.files.first.name;
                  bytesFile = resultat.files.first.bytes;
                });
                popupimage();
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
          child: Row(
            children: const [
              Icon(Icons.logout),
              Text(
                "Déconnexion",
                style: TextStyle(fontFamily: "GameOfSquids", color: Colors.red),
              ),
            ],
          ),
          onTap: () {
            print("OK");
            firebaseHelp().deco().then((value){
              print("ok333333");
              Navigator.of(context).push( MaterialPageRoute(
                  builder: (_) => connexion()));
            });
          },
        )
        ],
      ),
    );
  }
}

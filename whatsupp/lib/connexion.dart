import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';
import 'package:whatsupp/acceuil.dart';
import 'package:whatsupp/inscription.dart';

class connexion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return connexionState();
  }
}

class connexionState extends State<connexion> {
  late String mail;
  late String mdp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text("Connexion",
              style: TextStyle(fontFamily: 'GameOfSquids')),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fond_vert.jpeg"),
                fit: BoxFit.cover,
                opacity: 0.8),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: ((value) {
                      mail = value;
                    }),
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Mail*',
                        hintText: 'un mail est attendu'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: ((value) {
                      mdp = value;
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'mot de passe*',
                        hintText: 'un mot de passe est attendu'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 60),
                            maximumSize: const Size(200, 60),
                            primary: Colors.green),
                        onPressed: () {
                          
                            print("ok");
                            firebaseHelp().Connexion(mail, mdp).then((value){
                              firebaseHelp().reco();
                              print("ok2");
                                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                  return acceuil();
                                })));
                            }).catchError((onError){
                              Popup();
                            });

                            
                          
                        },
                        child: const Text(
                          "Connexion",
                          style: TextStyle(fontFamily: "GameOfSquids"),
                        )),
                  ],
                ),
                InkWell(
                  child: const Text("je n'ai pas de compte!", style: TextStyle(color: Colors.blue, fontFamily: "GameOfSquids"),textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return inscription();
                    }));
                  },
                )
              ],
            ),
          ),
        ));
  }
  Popup(){
    showDialog(
      context: context, 
      builder: (context){
        if(Platform.isIOS){
          return CupertinoAlertDialog(
            title: const Text("Erreur verifiez vos informations \ncode: ERROR_CREDENTIAL"),
            actions: [
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text("OK"))
            ],
          );
        } else {
          return AlertDialog(
            title: const Text("Erreur verifiez vos informations \ncode: ERROR_CREDENTIAL"),
            actions: [
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text("OK"))
            ],
          );
        }
      }
      );
  }
}

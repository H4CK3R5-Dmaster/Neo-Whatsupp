import 'package:flutter/material.dart';
import 'package:whatsupp/acceuil.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';


class inscription extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return inscriptionState();
  }
}

class inscriptionState extends State<inscription> {
  late String mail;
  late String tel;
  late String nom;
  late String prenom;
  late String mdp;
  late String mdpconfirm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Inscription",
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
                      nom = value;
                    }),
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Nom*',
                        hintText: 'un nom est attendu'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: ((value) {
                      prenom = value;
                    }),
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Prenom*',
                        hintText: 'un prenom est attendu'),
                  ),
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
                        labelText: 'mail*',
                        hintText: 'un mail est attendu'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: ((value) {
                      tel = value;
                    }),
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'numéro de tel*',
                        hintText: 'numéro est attendu'),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: ((value) {
                      mdpconfirm = value;
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'confirmez mot de passe*',
                        hintText: 'confirmez votre mot de passe'),
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
                          if (mdp == mdpconfirm) {
                            print("ok");
                            firebaseHelp().Inscription(nom, prenom, tel, mail, mdp);
                            Navigator.push(context, MaterialPageRoute(builder:((context) {
                              return acceuil();
                            })));
                          }
                        },
                        child: const Text(
                          "Inscription",
                          style: TextStyle(fontFamily: "GameOfSquids"),
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

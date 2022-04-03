// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsupp/model/users.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class firebaseHelp {
  final auth = FirebaseAuth.instance;
  final final_user = FirebaseFirestore.instance.collection("Users");
  final fireStorage = FirebaseStorage.instance;
 
  Future Inscription(String nom, String prenom, String tel, String mail,
      String password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    User? user = result.user;
    String uid = user!.uid;
    var r = token(22);
    Map<String, dynamic> map = {
      "NOM": nom,
      "PRENOM": prenom,
      "MAIL": mail,
      "TEL": tel,
      "PASSWORD": password,
      "TOKEN": r,
      "isConnected": true
    };
    addUser(uid, map);
  }

  Future Connexion(String mail, String password) async {
    UserCredential resultat =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
  }

  addUser(String uid, Map<String, dynamic> map) {
    
    final_user.doc(uid).set(map);
  }

  updatedUser(String uid, Map<String, dynamic> map) {
    final_user.doc(uid).update(map);
  }

  Future<String> getIdentifiant() async {
    String uid = auth.currentUser!.uid;
    return uid;
  }
  

  Future<users> getUtilisateur(String uid) async {
    DocumentSnapshot snapshot = await final_user.doc(uid).get();
    return users(snapshot);
  }
  deco() async{
    String getuid = auth.currentUser!.uid;
    Map<String, dynamic> map = {
      
      "isConnected": false
    };
    var collection = FirebaseFirestore.instance.collection('Users');
    await collection.doc(getuid).update(map);
  }
  reco() async{
    String getuid = auth.currentUser!.uid;
    Map<String, dynamic> map = {
      
      "isConnected": true
    };
    var collection = FirebaseFirestore.instance.collection('Users');
    await collection.doc(getuid).update(map);
  }
  getdoc() async {
    final gotcha = FirebaseFirestore.instance.collection("Users").get();
    QuerySnapshot querySnapshot = await gotcha;
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print("documents = "+a.id);
      
    }
    // var det = querySnapshot.docs.forEach((element) {
    //   var f = element["TEL"];
    //   for (var i = 0; i < element["TEL"].toString().length; i++) {
    //     print(element["TEL"].toString());
    //   }
    // });
     var data = querySnapshot.docs.forEach((doc) {
       
       print(doc["TEL"]);
       for (var i = 0; i < 4; i++) {
         print("$i = ${doc["TEL"]}");
       }
       
       
      
     });
    
     
      
      
    
    
  }
  
}

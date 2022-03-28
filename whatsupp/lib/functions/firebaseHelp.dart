import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsupp/model/users.dart';

class firebaseHelp {
  final auth = FirebaseAuth.instance;
  final final_user = FirebaseFirestore.instance.collection("Users");
  final fireStorage = FirebaseStorage.instance;

  Future Inscription(String nom, String prenom, String mail, String password)async{
    UserCredential result = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    User? user = result.user;
    String uid = user!.uid;
    var r = token(22);
    Map<String,dynamic>map = {
      "NOM":nom,
      "PRENOM":prenom,
      "MAIL":mail,
      "PASSWORD":password,
      "TOKEN":r

    };
    addUser(uid, map);
    
  }

  addUser(String uid,Map<String,dynamic>map){
    final_user.doc(uid).set(map);
  }
}
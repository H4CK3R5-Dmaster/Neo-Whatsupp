import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsupp/model/users.dart';

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
}

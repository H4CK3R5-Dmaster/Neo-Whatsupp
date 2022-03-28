import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
class users {
  String id = '';
  String? avatar;
  String nom = '';
  String prenom = '';
  String mail = '';
  String token ='';
  String tel = '';
  bool isConnected = false;

  users(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    token = map["TOKEN"];
    avatar = map["AVATAR"];
  }
  users.vide();
  
}
String token(int len){
  const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_,:";
  Random rnd = Random();
  var r = List.generate(len, (index) => alphabet[rnd.nextInt(alphabet.length)]).join();
  String first = "ODTaPp2.";
  return first + r;
}
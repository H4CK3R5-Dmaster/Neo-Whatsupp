import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsupp/model/messagesTOFROM.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';

class firebaseHelpMessages {
  final coll = FirebaseFirestore.instance.collection("messages");
  final storage = FirebaseStorage.instance;

  Future addToDatabase(String to, String from, String content)async{
    var uid = getId();
    Map<String,dynamic>mapp = {
      "TO":to,
      "FROM":from,
      "CONTENT":content
    };
    addData(uid, mapp);
    
  }
  addData(var uid, Map<String,dynamic>map){
    coll.doc(uid).set(map);
  }

  Future <String> getId() async{
    String uid = coll.doc().id;
    return uid;
  }

  
}
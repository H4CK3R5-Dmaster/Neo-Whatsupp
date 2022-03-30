import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsupp/model/messagesTOFROM.dart';

class firebaseHelpMessages {
  final coll = FirebaseFirestore.instance.collection("messages");
  final storage = FirebaseStorage.instance;
  
}
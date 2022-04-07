import 'package:cloud_firestore/cloud_firestore.dart';


class messagesTOFROM {
  String id = '';
  String to = '';
  String from = '';
  String content = '';

  messagesTOFROM(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> mess = snapshot.data() as Map<String,dynamic>;
    to = mess['TO'];
    from = mess['FROM'];
    content = mess['CONTENT'];
  }

  messagesTOFROM.vide();
}
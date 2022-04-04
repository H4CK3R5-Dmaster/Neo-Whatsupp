import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsupp/connexion.dart';
import 'package:whatsupp/drawer/draweracceuil.dart';
import 'package:whatsupp/model/users.dart';
import 'package:whatsupp/fullcontact.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';

class acceuil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return acceuilState();
  }
}

class acceuilState extends State<acceuil> {
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: draweracceuil(),
      appBar: AppBar(
        
        backgroundColor: Colors.green[400],
        title:
            const Text("Acceuil", style: TextStyle(fontFamily: 'GameOfSquids')),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var map = firebaseHelp().getContactofUser();
          // print(map);
          
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FlutterContactsExample();
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      drawerEnableOpenDragGesture: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              IconButton(onPressed: () {}, icon: Icon(Icons.home))
            ],
          )),
    );
    
    

  }
  

  
  

   

}
import 'package:flutter/material.dart';

class connexion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return connexionState();
  }
}
class connexionState extends State<connexion> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title:
            const Text("Connexion", style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  }
}
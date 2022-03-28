import 'package:flutter/material.dart';

class inscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return inscriptionState();
  }
}
class inscriptionState extends State<inscription> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title:
            const Text("Inscription", style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fond_vert.jpeg"),
              fit: BoxFit.cover,
              opacity: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Nom',
                  hintText: 'un nom est attendu'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
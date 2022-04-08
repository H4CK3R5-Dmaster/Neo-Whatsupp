import 'package:flutter/material.dart';

class notfoundaccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return notfoundaccountState();
  }
}

class notfoundaccountState extends State<notfoundaccount>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("non existant",
            style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
           children: [
             SizedBox(height: 600,),
             Text("Le contact n'a pas de compte", style: TextStyle(fontSize: 30),)
           ],
        ),
      ),
    );
  }
}
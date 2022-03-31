import 'package:flutter/material.dart';

class acceuil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return acceuilState();
  }
}

class acceuilState extends State<acceuil> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer:draw(),
      appBar: AppBar(
        leading: Container(),
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
        onPressed: () {},
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
              
              IconButton(onPressed: () {
               // Scaffold.of(context).openDrawer();
                key.currentState!.openDrawer();
              }, icon: Icon(Icons.menu)),
              IconButton(onPressed: () {}, icon: Icon(Icons.home))
              
            ],
          )),
    );
  }
}

Widget draw(){
  return Drawer(
    child: Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        InkWell(
          child: Row(
            children: const [
              Icon(Icons.logout),
              Text("Déconnexion", style: TextStyle(fontFamily: "GameOfSquids", color: Colors.red),),
              
            ],
          ),
          onTap: () {
            print("OK");
          },
        )
      ],
    ),
  );
}

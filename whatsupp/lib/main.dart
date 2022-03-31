import 'package:flutter/material.dart';
import 'package:whatsupp/connexion.dart';
import 'package:whatsupp/inscription.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Neo Whatsup",
            style: TextStyle(color: Colors.white, fontFamily: "GameOfSquids")),
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
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Text("BIENVENUE",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontFamily: 'GameOfSquids',
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 60),
                        maximumSize: const Size(200, 60),
                        primary: Colors.green
                        ),
                        
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return connexion();
                      }));
                    },
                    child: const Text(
                      "Connexion",
                      style: TextStyle(fontFamily: "GameOfSquids"),
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 60),
                        maximumSize: const Size(200, 60),
                        primary: Colors.green
                        ),
                        
                        
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return inscription();
                      }));
                      
                    },
                    child: const Text(
                      "Inscription",
                      style: TextStyle(fontFamily: "GameOfSquids"),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

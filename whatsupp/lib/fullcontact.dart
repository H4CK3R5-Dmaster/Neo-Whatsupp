import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsupp/drawer/draweracceuil.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';

import 'model/users.dart';

class FlutterContactsExample extends StatefulWidget {
  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
  List<String> lol = [];
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Contacts",
            style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
          )),
    );
  }

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());

    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => Card(
              color: Colors.green[100],
              elevation: 0.5,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                  title: Text(
                    _contacts![i].displayName,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async {
                    final fullContact =
                        await FlutterContacts.getContact(_contacts![i].id);

                    print(_contacts![i].phones[0].number);
                    if (lol.contains(_contacts![i].phones[0].number) == false) {
                      lol.add(_contacts![i].phones[0].number);
                    }
                    bool nuf = true;
                    print("\n--------------------------\n");
                    var yes = await firebaseHelp().getdoc(lol);

                    if (yes == false) {
                      print("false");
                    }
                    if (yes == nuf) {
                      print("ok");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ContactPage(fullContact!)));
                    }

                    // print("ok");
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
                  }),
            ));
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(contact.name.first,
            style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ecrire un message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    )
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: () {print("envoyer!");},
                      child: Icon(Icons.send, color: Colors.white,size: 18,),
                      backgroundColor: Colors.green,
                      elevation: 0,
                      )

                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
          )),
    );
  }
}

// appBar: AppBar(
        
//         backgroundColor: Colors.green[400],
//         title:
//             Text(contact.name.first, style: TextStyle(fontFamily: 'GameOfSquids')),
//         centerTitle: true,
//       ),
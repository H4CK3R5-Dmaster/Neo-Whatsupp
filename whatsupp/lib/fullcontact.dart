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
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(100,10, 25, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              
              const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                          fit: BoxFit.cover
                    
                  )
                ),
              ),
              Text(
                'prenom: ${contact.name.first}',
                textAlign: TextAlign.center,
              ),
              Text(
                'nom: ${contact.name.last}',
                textAlign: TextAlign.center,
              ),
              Text(
                'numero: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(pas de numero)'}',
                textAlign: TextAlign.center,
              ),
              Text(
                'adresse email: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(pas d\'email)'}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
          
        
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
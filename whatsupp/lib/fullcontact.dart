
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsupp/functions/firebaseHelp.dart';

class FlutterContactsExample extends StatefulWidget {
  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
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
        title:
            const Text("Contacts", style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    firebaseHelp().getdoc();
    
    
      return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contacts![i].displayName),
            onTap: () async {
              final fullContact = await FlutterContacts.getContact(_contacts![i].id);
                  // if (_contacts![i].phones.first.number == firebaseHelp().getdoc()) {
                  //   print("ok");
                  //   Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
                  // } else {
                  //   print("nope");
                  // }
                  print(_contacts![i].phones.first.number);
              
            }));
    
    
    
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
        title:
            Text(contact.name.first, style: TextStyle(fontFamily: 'GameOfSquids')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          Text('prenom: ${contact.name.first}'),
          Text('nom: ${contact.name.last}'),
          Text(
              'numero: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(pas de numero)'}'),
          Text(
              'adresse email: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(pas d\'email)'}'),
      ])
    );
  }
      
}

// appBar: AppBar(
        
//         backgroundColor: Colors.green[400],
//         title:
//             Text(contact.name.first, style: TextStyle(fontFamily: 'GameOfSquids')),
//         centerTitle: true,
//       ),
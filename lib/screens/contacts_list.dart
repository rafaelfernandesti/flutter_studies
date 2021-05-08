import 'package:flutter/material.dart';
import 'package:flutter_files/database/Dao/contact_dao.dart';
import 'package:flutter_files/models/contact.dart';
import 'package:flutter_files/screens/transaction_form.dart';

import 'contact_form.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  final ContactDAO _dao = ContactDAO();
  @override
  Widget build(BuildContext context) {
    //contacts.add(Contact(0,'Teste',1234)); //teste de inserção na lista
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferir'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: [], //criando lista vazia como dado inicial
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                    child:
                        CircularProgressIndicator()); //barra de progresso para indicar carregamento dos dados
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact, onClique: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context)=>TransactionForm(contact)
                        )
                      );
                    },
                    );
                  },
                  itemCount: contacts.length,
                );
                break;
            }
            return Text('Unknown error');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactForm()))
            .then((value) => setState(() {})), //gambiarra
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClique;

  _ContactItem(this.contact, {@required this.onClique});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClique(), //funciona só com onClique()? sem o arrow?
                                // Resposta: não. sem a lambda a função é chamada imediatamente.
        title: Text(
          contact.nome,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          contact.conta.toString(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

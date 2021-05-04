import 'package:flutter/material.dart';
import 'package:flutter_files/screens/contacts_list.dart';
import 'package:flutter_files/screens/transaction_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                Row(
                  children: [
                    _FeatureItem(
                      nome:'Transfer',
                      icone:Icons.monetization_on,
                      onClique: ()=> _showContactsList(context),
                    ),
                    _FeatureItem(
                      nome:'Transaction Feed',
                      icone:Icons.description,
                      onClique: ()=> _showTransactionsList(context),
                    ),_FeatureItem(
                      nome:'Who are we?',
                      icone:Icons.account_tree,
                      onClique: ()=> print('Who are we?'),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mostrarLista(BuildContext context) {
    return ContactsList();
  }

  void _showContactsList(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ContactsList(),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );

  }
}

class _FeatureItem extends StatelessWidget {

  final String nome;
  final IconData icone;
  final Function onClique; //callback

  _FeatureItem({this.nome, this.icone, @required this.onClique});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClique(),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: 150,
            //color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icone,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  nome,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

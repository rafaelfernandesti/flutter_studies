import 'package:flutter/material.dart';
import 'package:flutter_files/screens/contacts_list.dart';

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
            Wrap(
              children: [
                _FeatureItem(
                  nome:'Transfer',
                  icone:Icons.monetization_on,
                ),
                _FeatureItem(
                  nome:'Transaction Feed',
                  icone:Icons.description,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mostrarLista(BuildContext context) {
    return ContactsList();
  }
}

class _FeatureItem extends StatelessWidget {

  final String nome;
  final IconData icone;

  _FeatureItem({this.nome, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactsList(),
                ),
            );
          },
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

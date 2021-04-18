import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_files/database/app_database.dart';
import 'package:flutter_files/screens/dashboard.dart';

import 'models/contact.dart';

void main() {
  runApp(Bytebank());
  save(Contact(0,'rafael',1000)).then((id) {
    findAll().then((contacts) {
      debugPrint(contacts.toString());
    });
  });
}

class Bytebank extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        )
      ),
      home: Dashboard(),
    );
  }
}


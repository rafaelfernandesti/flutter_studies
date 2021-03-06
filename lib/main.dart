import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_files/screens/dashboard.dart';

void main() {
  runApp(Bytebank());
  //save(Transaction(200.0, Contact(0,'Josh',2000))).then((transaction) => print("Salvando $transaction"));
  //findAll().then((value) => print('Our transactions: $value'));

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
          )),
      home: Dashboard(),
    );
  }
}

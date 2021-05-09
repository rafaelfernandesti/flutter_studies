import 'dart:convert';
import 'package:flutter_files/http/webclient.dart';
import 'package:flutter_files/models/contact.dart';
import 'package:flutter_files/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    try{
      Response response = await cliente.get(uri).timeout(Duration(seconds: 5));
      List<Transaction> transactions = _toTransactionList(response);
      return transactions;
    }on Exception catch(e)
    {
      print('Erro na leitura $e');
    }

  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson= jsonEncode(transactionMap);
    final Response resposta = await cliente.post(uri,headers: {
      'Content-type' : 'application/json',
      'password' : '1000',
    },body: transactionJson,);
    return _toTransaction(resposta);
  }

  List<Transaction> _toTransactionList(Response response) {
    List<dynamic> decodedJson = jsonDecode(response.body);
    print(decodedJson);
    List<Transaction> transactions = [];
    for(Map<String,dynamic> transactionJson in decodedJson){
      Map<String,dynamic> contactJson = transactionJson['contact'];
      Transaction transaction = Transaction(
          transactionJson['value'],
          Contact(
            0,
            contactJson['name'],
            contactJson['accountNumber'],
          )
      );
      transactions.add(transaction);
    }
    return transactions;
  }

  Transaction _toTransaction(Response resposta) {
    Map<String,dynamic> json = jsonDecode(resposta.body);

    Map<String,dynamic> contactJson = json['contact'];
    return Transaction(
        json['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        )
    );
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value':transaction.value,
      'contact':{
        'name': transaction.contact.nome,
        'accountNumber':transaction.contact.conta
      }
    };
    return transactionMap;
  }

}
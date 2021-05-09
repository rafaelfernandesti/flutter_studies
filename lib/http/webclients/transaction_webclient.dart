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
    final String transactionJson= jsonEncode(transaction.toJson());
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
      transactions.add(Transaction.fromJson(transactionJson));
    }
    return transactions;
  }

  Transaction _toTransaction(Response resposta) {
    Map<String,dynamic> json = jsonDecode(resposta.body);
    return Transaction.fromJson(json);
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
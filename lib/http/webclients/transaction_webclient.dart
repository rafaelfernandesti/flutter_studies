import 'dart:convert';
import 'package:flutter_files/http/webclient.dart';
import 'package:flutter_files/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    try{
      Response response = await cliente.get(uri).timeout(Duration(seconds: 5));
      List<dynamic> decodedJson = jsonDecode(response.body);
      //print(decodedJson);
      return decodedJson
          .map((dynamic element) => Transaction.fromJson(element))
          .toList();
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
    return Transaction.fromJson(jsonDecode(resposta.body));
  }
}
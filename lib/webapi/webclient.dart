import 'dart:convert';

import 'package:flutter_files/models/contact.dart';
import 'package:flutter_files/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client cliente = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()],);
Uri uri = Uri.http('192.168.0.104:8080', 'transactions');
Future<List<Transaction>> findAll() async {
  try{
    Response response = await cliente.get(uri).timeout(Duration(seconds: 5));
    //print(response.body.toString());
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
  }on Exception catch(e)
  {
    print('Erro na leitura $e');
  }

}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value':transaction.value,
    'contact':{
      'name': transaction.contact.nome,
      'accountNumber':transaction.contact.conta
    }
  };
  final String transactionJson= jsonEncode(transactionMap);
  final Response resposta = await cliente.post(uri,headers: {
    'Content-type' : 'application/json',
    'password' : '1000',
  },body: transactionJson,);
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

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    //print(data.toString());
    //print('URL: ${data.baseUrl}');
    //print('Headers: ${data.headers}');
    //print('Body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    //print(data.toString());
    //print('Method: ${data.method}');
    //print('Headers: ${data.headers}');
    //print('Body: ${data.body}');
    //print('Status code: ${data.statusCode}');
    return data;
  }

}
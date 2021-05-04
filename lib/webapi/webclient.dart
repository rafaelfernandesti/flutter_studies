import 'package:http/http.dart';

void findAll() async {
  try{
    Uri uri = Uri.http('192.168.0.104:8080', 'transactions');
    Response response = await get(uri);
    print(response.body.toString());
  }on Exception catch(e)
  {
    print('Erro na leitura $e');
  }

}
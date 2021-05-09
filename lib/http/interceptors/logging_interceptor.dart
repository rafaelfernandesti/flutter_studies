import 'package:http_interceptor/http_interceptor.dart';

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
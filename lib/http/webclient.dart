import 'package:flutter_files/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client cliente = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()],);
Uri uri = Uri.http('192.168.0.104:8080', 'transactions');


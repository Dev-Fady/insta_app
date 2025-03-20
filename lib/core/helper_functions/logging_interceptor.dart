import 'dart:developer';

import 'package:dio/dio.dart';

void loggingInterceptor(Dio dio) {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      log("Request: ${options.method} ${options.uri}");
      log("Request Headers: ${options.headers}");
      log("Request Body: ${options.data}");
      return handler.next(options); // متابعة الطلب
    },
    onResponse: (response, handler) {
      log("Response: ${response.statusCode} ${response.data}");
      log("Response Headers: ${response.headers}");
      return handler.next(response); // متابعة الاستجابة
    },
    onError: (DioException e, handler) {
      log("Error: ${e.message}");
      return handler.next(e); // متابعة الخطأ
    },
  ));
}
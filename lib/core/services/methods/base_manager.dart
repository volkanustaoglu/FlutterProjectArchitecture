import 'package:dio/dio.dart';

class BaseManager{
 static BaseManager? _instance;
  
  BaseManager._internal();
  
   static BaseManager? getInstance() {
    return _instance ??= BaseManager._internal();
  }

     Dio? _dio;
     final _baseUrl = 'https://localhost:8080/api/';
 

  Dio? jsonplaceholderApi(){
  _dio =Dio(BaseOptions(baseUrl: _baseUrl));
  return _dio;
  }
}
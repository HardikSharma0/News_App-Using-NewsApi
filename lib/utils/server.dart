import 'package:dio/dio.dart';
import './constants.dart';

class Server {
  _Server() {}
  static Future<Response<dynamic>> getHeadlines() {
    Future<Response<dynamic>> future = Dio().get(Constant.News_URL);
    return future;
  }
}

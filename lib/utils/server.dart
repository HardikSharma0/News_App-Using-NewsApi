import 'package:dio/dio.dart';
import './constants.dart';

class Server {
  static Future<Response<dynamic>> getHeadlines() {
    Future<Response<dynamic>> future = Dio().get(Constants.newsUrl);
    return future;
  }
}

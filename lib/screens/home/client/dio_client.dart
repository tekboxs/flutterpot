import 'package:dio/dio.dart';

class DioClient implements Client {
  Dio dio = Dio();
  @override
  Future getRequest(String url) async {
    return await dio.get(url);
  }
}

abstract class Client {
  //only will need get to display results
  Future getRequest(String url);
}

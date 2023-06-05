import '../api.dart';
import '../httpService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';


class OrderService {
  final String baseUrl = Link.API_URL;
  final storage = const FlutterSecureStorage();
  final HttpService httpService = HttpService();
  var jsonList;

  dynamic getOrders() async {
    try {
      var response = await Dio().get('http://192.168.56.1:3000/api/orders/list');
      if (response.statusCode == 200) {
        jsonList = await response.data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return jsonList;
  }


}


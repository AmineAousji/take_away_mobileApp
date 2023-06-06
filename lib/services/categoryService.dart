import '../api.dart';
import '../httpService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';


class CategoryService {
  final String baseUrl = Link.API_URL;
  final storage = const FlutterSecureStorage();
  final HttpService httpService = HttpService();
  var jsonList;

  dynamic getCategories() async {
    try {
      var response = await Dio().get('http://192.168.56.1:3000/api/categories/list');
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

  void getData() async {
    try {
      var response = await Dio().get('$baseUrl/categories/list');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  dynamic getCourisersBycategry(String categoryName) async {
    try {

      var response = await Dio().get('$baseUrl/categories/$categoryName/coursiers');

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


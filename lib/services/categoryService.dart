import 'dart:async';
import 'dart:convert';
import '../api.dart';
import '../httpService.dart';
import '../models/categoriesModel.dart';
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

  // Future<List<Categories>?> getCategories() async {
  //   List<Map<String, dynamic>> myList = [];
  //   final response = await httpService.get('/categories/list');
  //
  //   if (response.statusCode == 200) {
  //     json.decode(response.body).forEach((element){
  //       return Categories.fromJson(element).category_name;
  //     });
  //
  //
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  //   return null;
  // }


  void getData() async {
    try {
      var response = await Dio()
          .get('$baseUrl/categories/list');
      print(response);
    } catch (e) {
      print(e);
    }
  }

}


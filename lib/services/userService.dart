import 'dart:convert';
import '../api.dart';
import '../httpService.dart';
import '../models/userModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';


class UserService {
  final String baseUrl = Link.API_URL;
  final storage = new FlutterSecureStorage();
  var dio = Dio();
  final HttpService httpService = HttpService();

  Future<dynamic> login(user) async {
    final response = await dio.post('$baseUrl/login');
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> tryLogin(String login, String password) async {

    print(login);
    print(password);
    final response = await httpService.post('/check',
      {'login': login, 'password': password},
    );

    if (response.statusCode == 200) {
      print(response.body);
      storage.read(key: 'token').then((value) => print(value??''));
      return storage.write(key: 'token', value: jsonDecode(response.body)['token']).then((value){
        return User.fromJson(jsonDecode(response.body));

      });
      // storage.read(key: 'token').then((value) => print(value??''));
    } else {
      throw Exception('Failed to login');
    }
  }
}
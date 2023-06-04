// import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpService {
  static const String baseUrl = Link.API_URL;
  static const Map<String, String> contentTypeHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final storage = new FlutterSecureStorage();



  Future<http.Response> get(String path) async {
    final url = Uri.parse('$baseUrl$path');
    Map<String, String>headers = {};
    return storage.read(key: 'token').then((value)async {
      headers['Authorization'] = value??'';
      return await http.get(url, headers: headers);
    });
  }

  Future<http.Response> post(String path, Map<String,dynamic> body) async{
    final url = Uri.parse('$baseUrl$path');
    Map<String, String>headers = {};
    return storage.read(key: 'token').then((value)async {
      headers['Authorization'] = value??'';
      headers.addAll(contentTypeHeader);
      return await http.post(url, headers: headers, body: jsonEncode(body));
    });
  }

  Future<http.Response> put(String path, Map<String, dynamic> body){
    final url = Uri.parse('$baseUrl$path');
    Map<String, String>headers = {};
    return storage.read(key: 'token').then((value)async {
      headers['Authorization'] = value??'';
      headers.addAll(contentTypeHeader);
      return await http.put(url, headers: headers, body: jsonEncode(body));
    });
  }

  Future<http.Response> delete(String path){
    final url = Uri.parse('$baseUrl$path');
    Map<String, String>headers = {};
    return storage.read(key: 'token').then((value)async {
      headers['Authorization'] = value??'';
      headers.addAll(contentTypeHeader);
      return await http.delete(url, headers: headers);
    });
  }

// Future<http.Response> post(String path, Map<String,dynamic> body) async{
//   final url = Uri.parse('$baseUrl$path');
//   Map<String, String>headers = {};
//   storage.read(key: 'token').then((value) => headers['Authorization'] = value??'');
//   headers.addAll(contentTypeHeader);
//   return await http.post(url, headers:headers, body: jsonEncode(body));
// }
}
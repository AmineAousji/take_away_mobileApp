import 'package:dio/dio.dart';
import 'package:take_away_app/models/coursierModel.dart';
import '../httpService.dart';
import '../api.dart';


class CoursierService {
  final HttpService httpService = HttpService();
  final String baseUrl = Link.API_URL;
  var jsonList;

  dynamic getCourisers() async {
    try {
      var response = await Dio().get('$baseUrl/coursiers/list');
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

  void addCoursiers(Map<String, dynamic> coursier) async{
    //print(coursier.name);
    try {
      var response = await Dio().post('$baseUrl/coursiers/', data: coursier);
      if (response.statusCode == 200) {
        print('Coursier has been added');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }



}
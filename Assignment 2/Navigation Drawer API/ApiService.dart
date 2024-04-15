import 'dart:developer';
import 'package:http/http.dart' as http;
import 'profileModel.dart';

class ApiService {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String usersEndPoint = "photos";

  Future<List<ProfileModel>?> getPhotos() async {
    try {
      var url = Uri.parse(baseUrl + usersEndPoint);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<ProfileModel> _model = profileModelFromJson(response.body);
        return _model;
      }
    } catch(e) {
      log(e.toString());
    }
  }
}
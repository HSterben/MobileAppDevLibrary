import 'dart:developer';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
      } catch(e) {
      log(e.toString());
    }
  }
}
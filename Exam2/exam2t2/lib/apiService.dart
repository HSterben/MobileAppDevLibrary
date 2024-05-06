import 'dart:developer';
import 'package:http/http.dart' as http;
import 'jeweleryModel.dart';

class ApiService {
  static String baseUrl = "https://fakestoreapi.com/";
  static String usersEndPoint = "products/category/jewelery";

  Future<List<JeweleryModel>?> getData() async {
    try {
      var url = Uri.parse(baseUrl + usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<JeweleryModel> _model = jeweleryModelFromJson(response.body);
        return _model;
      } else {
        // Log the response status code and body if the request fails
        log("Request failed with status: ${response.statusCode}, ${response.body}");
        return null;
      }
    } catch (e) {
      // Log any other exceptions that might occur during the request
      log("Error in getData: $e");
      return null;
    }
  }
}

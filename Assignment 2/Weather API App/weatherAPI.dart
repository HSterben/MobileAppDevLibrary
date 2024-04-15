import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weatherModel.dart';

class WeatherAPI {
  static const _apiKey = '67ce6bd0367d4a23855203236241304';
  static const _baseUrl = 'http://api.weatherapi.com/v1';

  Future<WeatherData?> getWeather(String location) async {
    try {
      var url = Uri.parse('$_baseUrl/forecast.json?key=$_apiKey&q=$location');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // return json.decode(response.body) as Map<String, dynamic>;
        var jsonBody = json.decode(response.body);
        return WeatherData.fromJson(jsonBody);
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
    return null;
  }
}
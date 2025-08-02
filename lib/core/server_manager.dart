import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_data_model.dart';

class ServerManager {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String apiKey = 'b782ebc88fc04bb3034612cf9db73b51';

  Future<WeatherDataModel> getTemperature(
      {required double lon, required double lat}) async {
    final response = await http.get(
        Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      //Ideal Happy Scenario
      return WeatherDataModel.fromJson(data);
    } else if (response.statusCode == 403 || response.statusCode == 401) {
      //Handling Errors
      throw ('Unauthorized, Forbidden ${response.statusCode} ${data['message']}');
    } else if (response.statusCode == 500) {
      throw ('Internal Server Error ${data['message']}');
    } else {
      throw ('Some error happened, try again');
    }
  }
}

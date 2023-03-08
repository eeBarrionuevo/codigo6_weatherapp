import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codigo6_weatherapp/models/location_weather_model.dart';

class ApiService {
  Future<LocationWeatherModel?> getWeatherData(String cityName) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=&q=$cityName&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      LocationWeatherModel locationWeather =
          LocationWeatherModel.fromJson(data);
      return locationWeather;
    }
    return null;
  }
}

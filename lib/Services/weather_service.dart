import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '0bfec04142ec423dbf2153304223008';
  // ignore: non_constant_identifier_names
  Future<WeatherModel?> getweather({required String CityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseurl/current.json?key=$apikey&q=$CityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      // ignore: avoid_print
      print('there is no such a city');
    }
    return weather;
  }
}

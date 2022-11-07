import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class  WeatherProvider with ChangeNotifier {
  WeatherModel? _weatherdata;
  String? cityname;
  set weatherdata(WeatherModel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  WeatherModel? get weatherdata => _weatherdata;
}

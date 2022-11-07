import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double mintemp;
  double maxtemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.mintemp,
    required this.maxtemp,
    required this.weatherStateName,
  });
  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temp: data['current']['temp_c'],
      mintemp: data['current']['wind_kph'],
      maxtemp: data['current']['feelslike_c'],
      weatherStateName: data['current']['condition']['text'],
    );
  }
  String getimage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'lib/assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'lib/assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Overcast') {
      return 'lib/assets/images/cloudy_mist_overcast.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'lib/assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'lib/assets/images/thunder.png';
    } else if (weatherStateName == 'Partly cloudy') {
      return 'lib/assets/images/partly_cloud.png';
    } else if (weatherStateName == 'Patchy light rain with thunder') {
      return 'lib/assets/images/light_rain_with_thunder.png';
    } else if (weatherStateName == 'Mist') {
      return 'lib/assets/images/mist.png';
    } else {
      return 'lib/assets/images/clear.png';
    }
  }

  MaterialColor gettheme() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Overcast') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.grey;
    } else if (weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}

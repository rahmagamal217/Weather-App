// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String? CityName;
  SearchPage({Key? key, this.updateui}) : super(key: key);
  VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (data) {
            CityName = data;
          },
          onSubmitted: (data) async {
            CityName = data;
            WeatherService service = WeatherService();
            WeatherModel? weather =
                await service.getweather(CityName: CityName!);
            Provider.of<WeatherProvider>(context, listen: false).weatherdata =
                weather;
            Provider.of<WeatherProvider>(context, listen: false).cityname =
                CityName;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            label: const Text('Search'),
            suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getweather(CityName: CityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherdata = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityname = CityName;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.search)),
            border: const OutlineInputBorder(),
            hintText: 'Enter a city',
          ),
        ),
      )),
    );
  }
}

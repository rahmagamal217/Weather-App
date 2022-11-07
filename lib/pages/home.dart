// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateui() {
    setState(() {});
  }

  WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    weatherdata = Provider.of<WeatherProvider>(context).weatherdata;
    return Scaffold(
        appBar: AppBar(title: const Text('Weather App'), actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateui: updateui,
                );
              }));
            },
            icon: const Icon(Icons.search),
          )
        ]),
        body: weatherdata == null
            ? Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is no weather😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching🔍now',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ))
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherdata!.gettheme(),
                  weatherdata!.gettheme()[300]!,
                  weatherdata!.gettheme()[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityname!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Updated at : ${weatherdata!.date.hour.toString()}:${weatherdata!.date.minute.toString()}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          weatherdata!.getimage(),
                        ),
                        Text(
                          weatherdata!.temp.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text('maxtemp : ${weatherdata!.maxtemp.toInt()}'),
                            Text('mintemp : ${weatherdata!.mintemp.toInt()}'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherdata!.weatherStateName,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ));
  }
}

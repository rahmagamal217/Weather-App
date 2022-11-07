import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/Home.dart';
import 'Providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<WeatherProvider>(
      create: (contex) => WeatherProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherdata ==
                  null
              ? Colors.blue
              : Provider.of<WeatherProvider>(context).weatherdata!.gettheme()),
      home: const HomePage(),
    );
  }
}

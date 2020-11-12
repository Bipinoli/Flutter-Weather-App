import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Weather App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: CustomColors.gray,
      ),
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Weather App",
      theme: ThemeData(
        primaryColor: CustomColors.red,
        fontFamily: "Lato",
      ),
      home: HomeScreen(),
    );
  }
}

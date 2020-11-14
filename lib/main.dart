import 'package:flutter/material.dart';
import 'package:weather_app/ui/constants/colors.dart';
import 'package:weather_app/ui/screens/details_screen/details_screen.dart';
import 'package:weather_app/ui/screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Weather App",
      theme: ThemeData(
        primaryColor: CustomColors.white,
        fontFamily: "Lato",
      ),
      home: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          HomeScreen(),
          DetailsScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

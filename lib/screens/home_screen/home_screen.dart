import "package:flutter/material.dart";
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/widgets/custom_graph/custom_graph.dart';

import 'bottom_row.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<double> dataY = [26, 28, 28, 24, 24];
  final List<String> labelImageUrls = [
    "http://openweathermap.org/img/wn/10d.png",
    "http://openweathermap.org/img/wn/10d.png",
    "http://openweathermap.org/img/wn/10d.png",
    "http://openweathermap.org/img/wn/10d.png",
    "http://openweathermap.org/img/wn/10d.png",
  ];
  final List<String> labelTexts = [
    "4 PM",
    "10 PM",
    "1 AM",
    "4 AM",
    "7 AM",
  ];
  final int highlightedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        toolbarHeight: 90.0,
        title: Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Calicut, Kerela",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: .5,
                  color: CustomColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Sunday, 1 AM",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.white,
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Today",
              style: TextStyle(
                fontSize: 24.0,
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                        "http://openweathermap.org/img/wn/10d@2x.png"),
                  ),
                  Text(
                    "28°",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    "Partly Cloudy",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            buildGraph(
                dataY: dataY,
                labelTexts: labelTexts,
                labelImageUrls: labelImageUrls,
                highlightedIndex: highlightedIndex),
            BottomRow(),
          ],
        ),
      ),
    );
  }
}

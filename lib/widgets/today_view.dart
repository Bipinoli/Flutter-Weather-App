import "dart:ui";

import "package:flutter/material.dart";

import 'custom_graph/custom_graph.dart';

class TodayView extends StatelessWidget {
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
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            decoration: BoxDecoration(
//              color: Theme.of(context).accentColor,
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Pressure",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "810mb",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Visibility",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "5km",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Humidity",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "94%",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildGraph(
              dataY: dataY,
              labelTexts: labelTexts,
              labelImageUrls: labelImageUrls,
              highlightedIndex: highlightedIndex),
        ],
      ),
    );
  }
}

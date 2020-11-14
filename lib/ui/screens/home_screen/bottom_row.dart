import "dart:ui";

import "package:flutter/material.dart";
import 'package:weather_app/ui/constants/colors.dart';

class BottomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      margin: EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Pressure",
                    style: TextStyle(
                      color: CustomColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "1021 hpa",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: CustomColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Wind",
                    style: TextStyle(
                      color: CustomColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "0.21 m/s",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: CustomColors.black,
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
                      color: CustomColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "94%",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: CustomColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

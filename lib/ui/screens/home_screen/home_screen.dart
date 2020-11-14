import "package:flutter/material.dart";
import 'package:weather_app/ui/constants/colors.dart';
import 'package:weather_app/ui/widgets/custom_graph/custom_graph.dart';

import 'bottom_row.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<double> dataY = [26, 28, 28, 24];
  final List<String> labelImageUrls = [
    "http://openweathermap.org/img/wn/01d.png",
    "http://openweathermap.org/img/wn/02d.png",
    "http://openweathermap.org/img/wn/03d.png",
    "http://openweathermap.org/img/wn/10d.png",
  ];
  final List<String> labelTexts = [
    "morning",
    "day",
    "evening",
    "night",
  ];
  final int highlightedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
//        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          toolbarHeight: 90.0,
          title: Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: CustomColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter you city ...",
                  ),
                  onSubmitted: (value) {
                    print("entered city $value");
                  },
                ),
              ],
            ),
          ),
          elevation: 0.0,
          actions: [
//            IconButton(
//                icon: Icon(Icons.search, size: 32.0),
//                onPressed: () {
//                  print("clicked");
//
////                FocusScope.of(context).requestFocus(FocusNode());
//                  SystemChannels.textInput.invokeMethod('TextInput.show');
//                }),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                "3:08 PM",
                style: TextStyle(
                  fontSize: 30.0,
                  color: CustomColors.black,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Saturday, Nov 14, 2020",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.black,
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
                      "28° C",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Partly Cloudy",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.black,
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
      ),
    );
  }
}

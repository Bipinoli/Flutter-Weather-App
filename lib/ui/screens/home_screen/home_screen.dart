import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather.dart';
import 'package:weather_app/ui/constants/colors.dart';
import 'package:weather_app/ui/widgets/custom_graph/custom_graph.dart';

import 'bottom_row.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
                Consumer<WeatherProvider>(builder: (context, provider, child) {
                  String hintText = provider.isWeatherAvailable
                      ? provider.weeklyWeather.city
                      : "Enter you city ...";
                  return TextField(
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: CustomColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                    ),
                    onSubmitted: (value) {
                      print("entered city $value");
                      provider.fetchWeatherAction(value);
                    },
                  );
                }),
              ],
            ),
          ),
          elevation: 0.0,
        ),
        body: Consumer<WeatherProvider>(
          builder: (context, provider, child) {
            if (!provider.isWeatherAvailable)
              return Center(
                child: Text(
                  "I don't have any information yet!",
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 20.0,
                  ),
                ),
              );

            String suitableTemp = (() {
              var partOfDay = provider.weeklyWeather.partOfDay;
              if (partOfDay == PartOfDay.morning)
                return provider.weeklyWeather.weather[0].morningTemp;
              if (partOfDay == PartOfDay.day)
                return provider.weeklyWeather.weather[0].dayTemp;
              if (partOfDay == PartOfDay.evening)
                return provider.weeklyWeather.weather[0].eveningTemp;
              return provider.weeklyWeather.weather[0].nightTemp;
            })();

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    provider.weeklyWeather.currentTime,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: CustomColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    provider.weeklyWeather.date,
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
                          image: NetworkImage(provider
                              .weeklyWeather.weather[0].bigWeatherIconURL),
                        ),
                        Text(
                          suitableTemp,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          provider.weeklyWeather.weather[0].weatherDescription,
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
                      dataY: [
                        provider.weeklyWeather.weather[0].morningTempValue
                            .round(),
                        provider.weeklyWeather.weather[0].dayTempValue.round(),
                        provider.weeklyWeather.weather[0].eveningTempValue
                            .round(),
                        provider.weeklyWeather.weather[0].nightTempValue
                            .round(),
                      ],
                      labelTexts: [
                        "morning",
                        "day",
                        "evening",
                        "night",
                      ],
                      labelImageUrls: [
                        provider.weeklyWeather.weather[0].weatherIconURL,
                        provider.weeklyWeather.weather[0].weatherIconURL,
                        provider.weeklyWeather.weather[0].weatherIconURL,
                        provider.weeklyWeather.weather[0].weatherIconURL,
                      ],
                      highlightedIndex: (() {
                        final partsOfDay = [
                          PartOfDay.morning,
                          PartOfDay.day,
                          PartOfDay.evening,
                          PartOfDay.night
                        ];
                        return partsOfDay
                            .indexOf(provider.weeklyWeather.partOfDay);
                      })()),
                  BottomRow(
                    humidity: provider.weeklyWeather.weather[0].humidity,
                    pressure: provider.weeklyWeather.weather[0].pressure,
                    wind: provider.weeklyWeather.weather[0].wind,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//class _HomeScreenState extends State<HomeScreen> {
//  final List<double> dataY = [26, 28, 28, 24];
//  final List<String> labelImageUrls = [
//    "http://openweathermap.org/img/wn/01d.png",
//    "http://openweathermap.org/img/wn/02d.png",
//    "http://openweathermap.org/img/wn/03d.png",
//    "http://openweathermap.org/img/wn/10d.png",
//  ];
//  final List<String> labelTexts = [
//    "morning",
//    "day",
//    "evening",
//    "night",
//  ];
//  final int highlightedIndex = 2;
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        FocusScope.of(context).unfocus();
////        SystemChannels.textInput.invokeMethod('TextInput.hide');
//      },
//      child: Scaffold(
//        backgroundColor: CustomColors.white,
//        appBar: AppBar(
//          toolbarHeight: 90.0,
//          title: Container(
//            padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                TextField(
//                  textAlign: TextAlign.center,
//                  textCapitalization: TextCapitalization.sentences,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: CustomColors.black,
//                    fontWeight: FontWeight.bold,
//                  ),
//                  decoration: InputDecoration(
//                    hintText: "Enter you city ...",
//                  ),
//                  onSubmitted: (value) {
//                    print("entered city $value");
//                  },
//                ),
//              ],
//            ),
//          ),
//          elevation: 0.0,
//          actions: [
////            IconButton(
////                icon: Icon(Icons.search, size: 32.0),
////                onPressed: () {
////                  print("clicked");
////
//////                FocusScope.of(context).requestFocus(FocusNode());
////                  SystemChannels.textInput.invokeMethod('TextInput.show');
////                }),
//          ],
//        ),
//        body: Container(
//          padding: EdgeInsets.symmetric(horizontal: 16.0),
//          child: Column(
//            children: [
//              SizedBox(
//                height: 10.0,
//              ),
//              Text(
//                "3:08 PM",
//                style: TextStyle(
//                  fontSize: 30.0,
//                  color: CustomColors.black,
//                ),
//              ),
//              SizedBox(
//                height: 5.0,
//              ),
//              Text(
//                "Saturday, Nov 14, 2020",
//                style: TextStyle(
//                  fontSize: 14.0,
//                  fontWeight: FontWeight.w400,
//                  color: CustomColors.black,
//                ),
//              ),
//              Container(
//                height: MediaQuery.of(context).size.height * .3,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Image(
//                      image: NetworkImage(
//                          "http://openweathermap.org/img/wn/10d@2x.png"),
//                    ),
//                    Text(
//                      "28° C",
//                      style: TextStyle(
//                        fontSize: 32.0,
//                        fontWeight: FontWeight.bold,
//                        color: CustomColors.black,
//                      ),
//                    ),
//                    SizedBox(height: 10.0),
//                    Text(
//                      "Partly Cloudy",
//                      style: TextStyle(
//                        fontSize: 16.0,
//                        fontWeight: FontWeight.w400,
//                        color: CustomColors.black,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              buildGraph(
//                  dataY: dataY,
//                  labelTexts: labelTexts,
//                  labelImageUrls: labelImageUrls,
//                  highlightedIndex: highlightedIndex),
//              BottomRow(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/widgets/sunrise_sunset_visual/sunrise_sunset.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hiding");
        SystemChannels.textInput.invokeMethod("TextInput.hide");
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 45.0, bottom: 20.0),
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "This Week",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .50,
                child: ListView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "WED",
                              style: TextStyle(
                                color: CustomColors.black,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              "24° C",
                              style: TextStyle(
                                color: CustomColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Image(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/10d.png")),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "Rainy",
                                    style: TextStyle(
                                      color: CustomColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Sun",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(child: SunriseSunset()),
//            Container(
//              height: 100.0,
//              color: Colors.blue,
//            ),
            ],
          ),
        ),
//
      ),
    );
  }
}

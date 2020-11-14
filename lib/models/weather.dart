import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_data.dart';

class WeeklyWeather {
  String city;
  int timezone;
  List<WeatherData> weather;

  WeeklyWeather({this.city, this.timezone, this.weather});

  DateTime get currentDateTime {
    final DateTime currentUtcTime = DateTime.now().toUtc();
    final Duration duration = Duration(seconds: timezone);
    return currentUtcTime.add(duration);
  }

  String get currentTime {
    return DateFormat("h:mm a").format(currentDateTime);
  }

  String get date {
    return DateFormat("E, MMMM d, y").format(currentDateTime);
  }

  @override
  String toString() {
    return """
      city: $city
      timezone: $timezone
      weather: [
      {
        ...
      },
    """;
  }

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) {
    return WeeklyWeather(
      city: json["city"]["name"],
      timezone: json["city"]["timezone"],
      weather: <WeatherData>[
        ...json["list"].map((data) {
          return WeatherData(
            timeStamp: data["dt"],
            sunSetTimeStamp: data["sunset"],
            sunRiseTimeStamp: data["sunrise"],
            pressureValue: data["pressure"],
            humidityValue: data["humidity"],
            windSpeed: data["speed"],
            windAngle: data["deg"],
            weatherIcon: data["weather"][0]["icon"],
            weatherDescription: data["weather"][0]["description"],
            dayTempValue: data["temp"]["day"].toDouble(),
            eveningTempValue: data["temp"]["eve"].toDouble(),
            morningTempValue: data["temp"]["morn"].toDouble(),
            nightTempValue: data["temp"]["night"].toDouble(),
          );
        }).toList()
      ],
    );
  }

  factory WeeklyWeather.mock() {
    return WeeklyWeather(
      city: "Kathmandu",
      timezone: 20700,
      weather: <WeatherData>[
        WeatherData(
          timeStamp: 1605330900,
          sunRiseTimeStamp: 1605314356,
          sunSetTimeStamp: 1605353239,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "02d",
          weatherDescription: "few clouds",
          morningTempValue: 284.35,
          dayTempValue: 296.15,
          eveningTempValue: 289.31,
          nightTempValue: 285.33,
        ),
        WeatherData(
          timeStamp: 1605417300,
          sunRiseTimeStamp: 1605400802,
          sunSetTimeStamp: 1605439613,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "01d",
          weatherDescription: "sky is clear",
          morningTempValue: 284.35,
          dayTempValue: 295.15,
          eveningTempValue: 280.31,
          nightTempValue: 274.33,
        ),
        WeatherData(
          timeStamp: 1605503700,
          sunRiseTimeStamp: 1605487249,
          sunSetTimeStamp: 1605525989,
          pressureValue: 1031,
          humidityValue: 48,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "03d",
          weatherDescription: "scattered clouds",
          morningTempValue: 264.35,
          dayTempValue: 286.15,
          eveningTempValue: 280.31,
          nightTempValue: 265.33,
        ),
        WeatherData(
          timeStamp: 1605590100,
          sunRiseTimeStamp: 1605573696,
          sunSetTimeStamp: 1605612367,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "01d",
          weatherDescription: "sky is clear",
          morningTempValue: 284.35,
          dayTempValue: 296.15,
          eveningTempValue: 289.31,
          nightTempValue: 285.33,
        ),
        WeatherData(
          timeStamp: 1605676500,
          sunRiseTimeStamp: 1605660143,
          sunSetTimeStamp: 1605698746,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "10d",
          weatherDescription: "light rain",
          morningTempValue: 284.35,
          dayTempValue: 296.15,
          eveningTempValue: 289.31,
          nightTempValue: 285.33,
        ),
        WeatherData(
          timeStamp: 1605762900,
          sunRiseTimeStamp: 1605746590,
          sunSetTimeStamp: 1605785126,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "02d",
          weatherDescription: "few clouds",
          morningTempValue: 284.35,
          dayTempValue: 296.15,
          eveningTempValue: 289.31,
          nightTempValue: 285.33,
        ),
        WeatherData(
          timeStamp: 1605849300,
          sunRiseTimeStamp: 1605833038,
          sunSetTimeStamp: 1605871508,
          pressureValue: 1021,
          humidityValue: 38,
          windSpeed: 0.21,
          windAngle: 194,
          weatherIcon: "02d",
          weatherDescription: "few clouds",
          morningTempValue: 284.35,
          dayTempValue: 296.15,
          eveningTempValue: 289.31,
          nightTempValue: 285.33,
        ),
      ],
    );
  }
}

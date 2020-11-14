import 'package:intl/intl.dart';
import 'package:weather_app/models/utils.dart';

class WeatherData {
  int timeStamp;
  int timezone;
  int sunRiseTimeStamp;
  int sunSetTimeStamp;
  int pressureValue;
  int humidityValue;
  double windSpeed;
  int windAngle;
  String weatherIcon;
  String weatherDescription;
  double morningTempValue;
  double dayTempValue;
  double eveningTempValue;
  double nightTempValue;

  WeatherData({
    this.timeStamp,
    this.timezone,
    this.sunRiseTimeStamp,
    this.sunSetTimeStamp,
    this.pressureValue,
    this.humidityValue,
    this.windSpeed,
    this.windAngle,
    this.weatherIcon,
    this.weatherDescription,
    this.dayTempValue,
    this.eveningTempValue,
    this.morningTempValue,
    this.nightTempValue,
  });

  @override
  String toString() {
    return """
      timeStamp: $timeStamp
      timezone: $timezone
      sunRiseTimeStamp: $sunRiseTimeStamp
      sunSetTimeStamp: $sunSetTimeStamp
      pressureValue: $pressureValue
      humidityValue: $humidityValue
      windSpeed: $windSpeed
      windAngle: $windAngle
      weatherIcon: $weatherIcon
      weatherDescription: $weatherDescription
      dayTempValue: $dayTempValue
      eveningTempValue: $eveningTempValue
      morningTempValue: $morningTempValue
      nightTempValue: $nightTempValue
    """;
  }

  String get pressure {
    return "$pressureValue hpa";
  }

  String get humidity {
    return "$humidityValue %";
  }

  String get wind {
    return "$windSpeed m/s";
  }

  String get weatherIconURL {
    return "http://openweathermap.org/img/wn/$weatherIcon.png";
  }

  String get bigWeatherIconURL {
    return "http://openweathermap.org/img/wn/$weatherIcon@2x.png";
  }

  String get sunriseTime {
    return DateFormat("h:mm a").format(getDateTime(sunRiseTimeStamp, timezone));
  }

  String get sunsetTime {
    return DateFormat("h:mm a").format(getDateTime(sunSetTimeStamp, timezone));
  }

  DateTime get sunriseDateTime {
    return getDateTime(sunRiseTimeStamp, timezone);
  }

  DateTime get sunsetDateTime {
    return getDateTime(sunSetTimeStamp, timezone);
  }

  String get weekDay {
    return DateFormat("EEEE").format(getDateTime(timeStamp, timezone));
  }

  String get morningTemp {
    return "${morningTempValue.round()}° C";
  }

  String get dayTemp {
    return "${dayTempValue.round()}° C";
  }

  String get eveningTemp {
    return "${eveningTempValue.round()}° C";
  }

  String get nightTemp {
    return "${nightTempValue.round()}° C";
  }
}

import 'package:intl/intl.dart';
import 'package:weather_app/models/utils.dart';

class WeatherData {
  int timeStamp;
  int sunRiseTimeStamp;
  int sunSetTimeStamp;
  double pressureValue;
  double humidityValue;
  double windSpeed;
  double windAngle;
  String weatherIcon;
  String weatherDescription;
  double morningTempValue;
  double dayTempValue;
  double eveningTempValue;
  double nightTempValue;

  WeatherData({
    this.timeStamp,
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
    return DateFormat("h:mm a").format(getDateTime(sunRiseTimeStamp));
  }

  String get sunsetTime {
    return DateFormat("h:mm a").format(getDateTime(sunSetTimeStamp));
  }

  DateTime get sunriseDateTime {
    return getDateTime(sunRiseTimeStamp);
  }

  DateTime get sunsetDateTime {
    return getDateTime(sunSetTimeStamp);
  }

  String get weekDay {
    return DateFormat("EEEE").format(getDateTime(timeStamp));
  }

  String get morningTemp {
    return "$morningTempValue° C";
  }

  String get dayTemp {
    return "$dayTempValue° C";
  }

  String get eveningTemp {
    return "$eveningTempValue° C";
  }

  String get nightTemp {
    return "$nightTempValue° C";
  }
}

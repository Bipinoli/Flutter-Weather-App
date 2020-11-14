import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/resources/repository.dart';

class WeatherProvider extends ChangeNotifier {
  WeeklyWeather _weeklyWeather;
  bool _isWeatherAvailable = false;

  bool get isWeatherAvailable => _isWeatherAvailable;

  WeeklyWeather get weeklyWeather => _weeklyWeather;

  void fetchWeatherAction(String cityName) {
    _commitWeatherAvailable(false);
    Repository.fetchWeather(cityName).then((value) {
      _commitWeeklyWeather(value);
      _commitWeatherAvailable(true);
    });
  }

  void _commitWeeklyWeather(WeeklyWeather weather) {
    this._weeklyWeather = weather;
    notifyListeners();
  }

  void _commitWeatherAvailable(bool isWeatherAvailable) {
    this._isWeatherAvailable = isWeatherAvailable;
    notifyListeners();
  }
}

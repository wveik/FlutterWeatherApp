import 'package:flutter/material.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {

  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';


  @override
  void initState() {
    super.initState();

    forecastObject = WeatherApi().fetchWeatherForecast(city: _cityName);
    forecastObject.then((weather) {
      print("*******");
      print(weather.list[0].weather[0].main);
      print("*******");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



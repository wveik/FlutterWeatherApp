import 'package:flutter_weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_weather_app/utils/constants.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({required String city}) async {

    var params = {
      'appid': Constants.APP_KEY,
      'units': 'metric',
      'q': city
    };


    var uri = Uri.https(
        Constants.DOMAIN_URL, Constants.FORECAST_PATH, params);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    // print(response.body);
    // print(json.decode(response.body));

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var firstItem = forecastList[0];

    var icon = firstItem.getIconUrl();
    var temp = firstItem.temp.day.round().toString();
    var description = firstItem.weather[0].description.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.network(
            icon,
            scale: 0.8,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                '$temp°C',
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.black87,
                ),
              ), Text(
                '$description',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

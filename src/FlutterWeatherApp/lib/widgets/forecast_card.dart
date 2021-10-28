import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_weather_app/utils/utils.dart';

class ForecastCard extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const ForecastCard({required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var currentItem = forecastList[index];

    var icon = currentItem.getIconUrl();
    var temp = currentItem.temp.day.round().toString();

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(currentItem.dt * 1000);

    String dayOfWeek = Utils.getDayFormattedDate(dateTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                dayOfWeek,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              icon,
              scale: 1.3,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  '$temp°C',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

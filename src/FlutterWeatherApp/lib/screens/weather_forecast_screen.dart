import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_weather_app/utils/constants.dart';
import 'package:flutter_weather_app/widgets/city_view.dart';
import 'package:flutter_weather_app/widgets/temp_view.dart';

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
    // forecastObject.then((weather) {
    //   print("*******");
    //   print(weather.list[0].weather[0].main);
    //   print("*******");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(Constants.BASE_NAME),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50),
                      TempView(snapshot: snapshot),
                    ],
                  );
                }

                return Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.black,
                    size: 100,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

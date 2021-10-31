import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/dto/CurrentPosition.dart';
import 'package:flutter_weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_weather_app/screens/city_screen.dart';
import 'package:flutter_weather_app/utils/location.dart';
import 'package:flutter_weather_app/widgets/bottom_list_view.dart';
import 'package:flutter_weather_app/widgets/city_view.dart';
import 'package:flutter_weather_app/widgets/detail_view.dart';
import 'package:flutter_weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final CurrentPosition? currentPosition;

  const WeatherForecastScreen({Key? key, required this.currentPosition})
      : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = "Moscow";

  @override
  void initState() {
    super.initState();

    if (widget.currentPosition != null) {
      forecastObject = WeatherApi().fetchWeatherForecastByCurrentPosition(
          position: widget.currentPosition!);

      return;
    }

    forecastObject =
        WeatherApi().fetchWeatherForecastByCityName(city: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("МОЛКОМ погода"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () async   {
            var currentPosition = await Location().getCurrentLocation();

            if (currentPosition == null)
              return;

            var currentForecastObject = WeatherApi().fetchWeatherForecastByCurrentPosition(
                position: currentPosition);

            setState(() {
              forecastObject = currentForecastObject;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var selectedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityScreen(),
                  ));

              if (selectedCity == null) return;

              setState(() {
                _cityName = selectedCity;
                forecastObject = WeatherApi()
                    .fetchWeatherForecastByCityName(city: _cityName);
              });
            },
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
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
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

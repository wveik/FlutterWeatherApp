import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/screens/weather_forecast_screen.dart';
import 'package:flutter_weather_app/utils/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    var currentPosition = await Location().getCurrentLocation();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherForecastScreen(
            currentPosition: currentPosition,
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }
}

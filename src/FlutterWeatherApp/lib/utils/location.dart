import 'package:flutter_weather_app/dto/CurrentPosition.dart';
import 'package:geolocator/geolocator.dart';

class Location {

  Future<CurrentPosition?> getCurrentLocation() async {
    try {
      var serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (serviceEnabled == false)
        return null;

      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));

      return CurrentPosition(
          latitude: position.latitude, longitude: position.longitude);
    } catch (ex) {
      print('Ошибка определения геолокации: $ex');
      return null;
    }
  }
}

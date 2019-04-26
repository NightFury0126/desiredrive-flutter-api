import 'dart:async';
import 'package:geolocator/geolocator.dart';

class DesireDriveGeocode {
  Future<Position> location() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<double> latitude() async {
    Position position = await location();
    return position.latitude;
  }

  Future<double> longitude() async {
    Position position = await location();
    return position.longitude;
  }
}
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'package:desiredrive_api_flutter/models/osm/nominatim_place.dart';
import 'package:desiredrive_api_flutter/service/nominatim/nominatim_request.dart';
import 'package:desiredrive_api_flutter/service/geocode/geocode.dart';

class DesireDriveCore {
  DesireDriveCore({this.http_identifier});

  final String http_identifier;

  static const MethodChannel _channel =
      const MethodChannel('desiredrive_api_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<NominatimPlaceModel> getPlace(double lat, double lon) {
    NominatimRequest request = new NominatimRequest();

    return request.getPlace(lat, lon);
  }

  Future<Position> getCoordinates() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    return geocode.location();
  }


  Future<double> getLatitude() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    return geocode.latitude();
  }

  Future<double> getLongitude() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    return geocode.longitude();
  }
}

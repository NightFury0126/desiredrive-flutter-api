import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/osm/nominatim_place.dart';
import 'package:desiredrive_api_flutter/constants/osmconstants.dart';

class NominatimRequest {

  Future<NominatimPlaceModel> getPlace(double lat, double lon) {
    return http.get(OsmConstants.API_URL + '/reverse?format=json&lat=' + lat.toString() + '&lon=' + lon.toString() + '&zoom=10&addressdetails=1').then((res) {
      var decode = json.decode(res.body);

      return NominatimPlaceModel.fromJson(decode);
    });
  }
}
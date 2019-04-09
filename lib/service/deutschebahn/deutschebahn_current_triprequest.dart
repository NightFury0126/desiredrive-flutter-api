import 'dart:convert';
import 'package:desiredrive_api_flutter/constants/apiconstants.dart';
import 'package:desiredrive_api_flutter/models/db_current_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DeutscheBahnCurrentTripRequest {
  DeutscheBahnCurrentTripRequest(this.latitude, this.longitude, this.options);

  final String latitude;
  final Map options;
  final String longitude;

  Future<http.Response> _fetchLocation() {
    return http.get(APIConstants.API_URL + APIConstants.API_ENDPOINT_STATIONS + "?coordinates.latitude=" + latitude + "&coordinates.longitude=" + longitude + "&weight=100");
  }

  Future<List<DeutscheBahnCurrentModel>> fetchCurrentTripRequest() {
    var id = "";
    var json;
    return _fetchLocation().then((result) {
      json = jsonDecode(result.body);
      id = json[0]['id'];
      return http.get(APIConstants.API_URL + APIConstants.API_ENDPOINT_STATIONS + "/" + id.toString() + "/departures").then((finished) {
        return compute(parseCurrentTripRequest, finished.body);
      });
    });
  }

  List<DeutscheBahnCurrentModel> parseCurrentTripRequest(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<DeutscheBahnCurrentModel>((json) => DeutscheBahnCurrentModel.fromJson(json)).toList();
  }
}
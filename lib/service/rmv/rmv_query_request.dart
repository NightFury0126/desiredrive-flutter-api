import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/rmv/rmv_query.dart';
import 'package:desiredrive_api_flutter/constants/rmvconstants.dart';

class RMVQueryRequest {

  Future<List<RMVQueryModel>> getStations(String query) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_NAME + RMVConstants.API_KEY + '&input=' + query).then((query) {
      var decode = json.decode(query.body);
      List<RMVQueryModel> parse = [];

      for (var i in decode) {
        parse.add(RMVQueryModel.fromJson(i));
      }

      return parse;
    });
  }

  Future<RMVQueryModel> getMostRelevantStation(String query) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_NAME + RMVConstants.API_KEY + '&input=' + query).then((res) {
      var decode = json.decode(res.body);

      return RMVQueryModel.fromJson(decode[0]);
    });
  }

  Future<RMVQueryModel> getNearestStation(double lat, double lon) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_NAME + RMVConstants.API_KEY + '&originCoordLat=' + lat.toString() + '&originCoordLong=' + lon.toString()).then((res) {
      var decode = json.decode(res.body);

      return RMVQueryModel.fromJson(decode[0]);
    });
  }

}
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/rmv/rmv_query.dart';
import 'package:desiredrive_api_flutter/constants/rmvconstants.dart';

class RMVQueryRequest {

  static Future<List<RMVQueryModel>> getStations(String query) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_NAME + RMVConstants.API_KEY + '&input=' + query + "&format=json").then((query) {
      var decode = json.decode(query.body);
      decode = decode['stopLocationOrCoordLocation'] ?? [];

      if (decode == []) return null;

      List<RMVQueryModel> parse = [];

      for (var i in decode) {
        parse.add(RMVQueryModel.fromJson(i));
      }

      return parse;
    });
  }

  static failure() {
    List<RMVQueryModel> parse = [];
    parse.add(RMVQueryModel.failure());
    return parse;
  }

  static Future<RMVQueryModel> getMostRelevantStation(String query) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_NAME + RMVConstants.API_KEY + '&input=' + query + "&format=json").then((res) {
      var decode = json.decode(res.body);

      return RMVQueryModel.fromJson(decode['stopLocationOrCoordLocation'][0]);
    });
  }

  static Future<List<RMVQueryModel>> getNearestStations(double lat, double lon, int max) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_QUERY_COORDINATES + RMVConstants.API_KEY + '&originCoordLat=' + lat.toString() + '&originCoordLong=' + lon.toString() + "&format=json&maxNo=" + max.toString()).then((res) {
      var decode = json.decode(res.body);
      List<RMVQueryModel> parse = [];
      decode = decode['stopLocationOrCoordLocation'];

      for (var i in decode) {
        parse.add(RMVQueryModel.fromJson(i));
      }

      return parse;
    });
  }

}
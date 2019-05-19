import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/rmv/rmv_departure.dart';
import 'package:desiredrive_api_flutter/constants/rmvconstants.dart';

class RMVDepartureRequest {
  static Future<List<RMVDepartureModel>> getDepartures(String id) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_DEPARTURE + RMVConstants.API_KEY + '&extId=' + id + '&format=json&maxJourneys=5').then((res) {
      var decode = json.decode(res.body);
      decode = decode['Departure'];

      List<RMVDepartureModel> parse = [];

      for (var i in decode) {
        parse.add(RMVDepartureModel.fromJson(i));
      }

      return parse;
    }).catchError((onError) {
      return null;
    });
  }

  static Future<List<RMVDepartureModel>> getMoreDepartures(String id) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_DEPARTURE + RMVConstants.API_KEY + '&extId=' + id + '&format=json').then((res) {
      var decode = json.decode(res.body);
      decode = decode['Departure'];

      List<RMVDepartureModel> parse = [];

      for (var i in decode) {
        parse.add(RMVDepartureModel.fromJson(i));
      }

      return parse;
    }).catchError((onError) {
      return null;
    });
  }
}


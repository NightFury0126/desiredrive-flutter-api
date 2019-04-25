import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/db_departure.dart';
import 'package:desiredrive_api_flutter/constants/dbconstants.dart';

class DeutscheBahnDepartureRequest {
  DeutscheBahnDepartureRequest({this.http_id, this.bounce_time});

  final String http_id;
  final int bounce_time;

  Future<List<DeutscheBahnDepartureModel>> getDepartures(String id) {
    return http.get(DBConstants.API_URL + DBConstants.API_ENDPOINT_STATIONS + '/' + id + DBConstants.API_ENDPOINT_DEPARTURES, headers: {'X-Identifier': http_id}).then((res) {
      var decode = json.decode(res.body);
      List<DeutscheBahnDepartureModel> parse = [];

      for (var i in decode) {
        parse.add(DeutscheBahnDepartureModel.fromJson(i));
      }

      return parse;
    });
  }

  Future<DeutscheBahnDepartureModel> getFirstDeparture(String id) {
    return http.get(DBConstants.API_URL + DBConstants.API_ENDPOINT_STATIONS + '/' + id + DBConstants.API_ENDPOINT_DEPARTURES, headers: {'X-Identifier': http_id}).then((res) {
      var decode = json.decode(res.body);

      return DeutscheBahnDepartureModel.fromJson(decode[0]);
    });
  }
}
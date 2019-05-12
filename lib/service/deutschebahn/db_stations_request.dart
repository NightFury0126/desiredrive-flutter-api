import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/deutschebahn/db_stations.dart';
import 'package:desiredrive_api_flutter/service/intelligent_query/query.dart';
import 'package:desiredrive_api_flutter/constants/dbconstants.dart';

class DeutscheBahnStationsRequest {
  DeutscheBahnStationsRequest({this.http_id, this.bounce_time});

  final String http_id;
  final int bounce_time;
  DesireQuery _queryOptimization = new DesireQuery();

  Future<List<DeutscheBahnStationsModel>> getStations(String query) async {
    return http.get(DBConstants.API_URL + DBConstants.API_ENDPOINT_STATIONS + '/?query=' + await _queryOptimization.query(query), headers: {'X-Identifier': http_id}).then((query) {
      var decode = json.decode(query.body);
      List<DeutscheBahnStationsModel> parse = [];

      for (var i in decode) {
        parse.add(DeutscheBahnStationsModel.fromJson(i));
      }

      return parse;
    });
  }

  Future<DeutscheBahnStationsModel> getMostRelevantStation(String query) {
    return http.get('https://2.db.transport.rest/stations?query=' + query, headers: {'X-Identifier': http_id}).then((res) {
      var decode = json.decode(res.body);

      return DeutscheBahnStationsModel.fromJson(decode[0]);
    });
  }

}
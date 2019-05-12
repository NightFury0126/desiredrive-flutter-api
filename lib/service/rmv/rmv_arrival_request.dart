import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:desiredrive_api_flutter/models/rmv/rmv_arrival.dart';
import 'package:desiredrive_api_flutter/constants/rmvconstants.dart';

class RMVArrivalRequest {
  Future<List<RMVArrivalModel>> getDepartures(String id) {
    return http.get(RMVConstants.API_URL + RMVConstants.API_ARRIVAL + RMVConstants.API_KEY + '&extId=' + id + '&format=json').then((res) {
      var decode = json.decode(res.body);
      List<RMVArrivalModel> parse = [];

      for (var i in decode) {
        parse.add(RMVArrivalModel.fromJson(i));
      }

      return parse;
    });
  }
}


import 'dart:convert';
import 'package:desiredrive_api_flutter/constants/apiconstants.dart';
import 'package:http/http.dart' as http;

class DeutscheBahnTripRequest {
  DeutscheBahnTripRequest(this.from, this.to, this.options);

  final String from;
  final Map options;
  final String to;

  Future<http.Response> fetchPost() {
    return http.get(APIConstants.API_URL + APIConstants.API_ENDPOINT_JOURNEYS + "?from.name=" + from + "&to.name=" + to);
  }
}
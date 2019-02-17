import 'dart:io';
import 'dart:convert';
import 'package:desiredrive_api_flutter/constants/apiconstants.dart';

class TripRequest {
  TripRequest(this.from, this.to, this.options) {
    init = TripRequestInit(this.from, this.to, this.options);
  }

  final String from;
  final Map options;
  final String to;

  TripRequestInit init;


}

class TripRequestInit {
  TripRequestInit(this.from, this.to, this.options) {
    init(this.options);
  }

  final String from;
  final Map options;
  final String to;

  var stations;
  var starttime;
  var arrivaltime;

  var rawResponse;

  init(Map options) async {
    stations = options['stations'];
    starttime = options['starttime'];
    arrivaltime = options['arrivaltime'];

    rawResponse = await HttpClient().getUrl(Uri.parse(APIConstants.API_URL))
        .then((request) => request.close())
        .then((response) => response.transform(Utf8Decoder()));
  }

  getRawRequest() {
    return rawResponse;
  }

  getFinalDestination() {
    return rawResponse['destination'];
  }

  getFinalStart() {
    return rawResponse['start'];
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:desiredrive_api_flutter/models/db_departure.dart';
import 'package:desiredrive_api_flutter/service/deutschebahn/db_departure_request.dart';
import 'package:desiredrive_api_flutter/service/deutschebahn/db_stations_request.dart';
import 'package:desiredrive_api_flutter/service/nominatim/nominatim_request.dart';
import 'package:desiredrive_api_flutter/service/geocode/geocode.dart';

class DeutscheBahnNearbyRequest {

  Future<List<DeutscheBahnDepartureModel>> getNearby() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    DeutscheBahnDepartureRequest departure = new DeutscheBahnDepartureRequest(http_id: 'TPT');
    DeutscheBahnStationsRequest stations = new DeutscheBahnStationsRequest(http_id: 'TPT');
    NominatimRequest nominatim = new NominatimRequest();

    return nominatim.getPlace(await geocode.latitude(), await geocode.longitude()).then((place) {
      return stations.getMostRelevantStation(place.city).then((db_stations) {
        return departure.getDepartures(db_stations.id).then((departures) {
          return departures;
        });
      });
    });
  }
}
import 'dart:async';

import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';
import 'package:desiredrive_api_flutter/models/osm/nominatim_place.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_stations.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/nearby.dart';
import 'package:desiredrive_api_flutter/service/deutschebahn/db_departure_request.dart';
import 'package:desiredrive_api_flutter/service/deutschebahn/db_stations_request.dart';
import 'package:desiredrive_api_flutter/service/nominatim/nominatim_request.dart';
import 'package:desiredrive_api_flutter/service/geocode/geocode.dart';

class DeutscheBahnNearbyRequest {

  Future<DeutscheBahnNearbyModel> getNearby() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    DeutscheBahnDepartureRequest departure = new DeutscheBahnDepartureRequest(http_id: 'TPT');
    DeutscheBahnStationsRequest stations = new DeutscheBahnStationsRequest(http_id: 'TPT');
    NominatimRequest nominatim = new NominatimRequest();

    return nominatim.getPlace(await geocode.latitude(), await geocode.longitude()).then((place) {
      return stations.getMostRelevantStation(place.city).then((db_stations) {
        return departure.getDepartures(db_stations.id).then((departures) {
          return DeutscheBahnNearbyModel.fromValues(db_stations, departures);
        });
      });
    });
  }

  Future<List<DeutscheBahnNearbyModel>> getNearbyList() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    DeutscheBahnDepartureRequest departure = new DeutscheBahnDepartureRequest(http_id: 'TPT');
    DeutscheBahnStationsRequest stations = new DeutscheBahnStationsRequest(http_id: 'TPT');
    NominatimRequest nominatim = new NominatimRequest();

    NominatimPlaceModel place = await nominatim.getPlace(await geocode.latitude(), await geocode.longitude());
    List<DeutscheBahnStationsModel> station_list = await stations.getStations(place.city);
    List<DeutscheBahnNearbyModel> nearbys = [];

    for (var i in station_list) {
      List<DeutscheBahnDepartureModel> departures = await departure.getDepartures(i.id);
      nearbys.add(DeutscheBahnNearbyModel.fromValues(i, departures));
    }

    return nearbys;
  }
}
import 'package:desiredrive_api_flutter/models/db_departure.dart';
import 'package:desiredrive_api_flutter/models/db_stations.dart';
class NearbyModel {
  final DeutscheBahnStationsModel stations;
  final List<DeutscheBahnDepartureModel> departure;

  NearbyModel({
    this.stations,
    this.departure,
  });

  factory NearbyModel.fromValues(DeutscheBahnStationsModel s, List<DeutscheBahnDepartureModel> d) {

    return NearbyModel(
        stations: s,
        departure: d
    );
  }
}
import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_stations.dart';
class DeutscheBahnNearbyModel {
  final DeutscheBahnStationsModel stations;
  final List<DeutscheBahnDepartureModel> departure;

  DeutscheBahnNearbyModel({
    this.stations,
    this.departure,
  });

  factory DeutscheBahnNearbyModel.fromValues(DeutscheBahnStationsModel s, List<DeutscheBahnDepartureModel> d) {

    return DeutscheBahnNearbyModel(
        stations: s,
        departure: d
    );
  }
}
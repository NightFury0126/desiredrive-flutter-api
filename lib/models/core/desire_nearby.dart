import 'package:desiredrive_api_flutter/models/rmv/rmv_arrival.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';

class DesireNearbyModel {
  final String name;
  final String stop;
  final String origin;
  final DateTime time;
  final DateTime realtime;
  final String source;

  DesireNearbyModel({
    this.name,
    this.stop,
    this.origin,
    this.time,
    this.realtime,
    this.source
  });

  factory DesireNearbyModel.fromRMV(RMVArrivalModel rmv) {

    return DesireNearbyModel(
        name: rmv.name,
        stop: rmv.stop,
        origin: rmv.origin,
        time: rmv.time,
        realtime: rmv.rtTime,
        source: "RMV"
    );
  }

  factory DesireNearbyModel.fromDeutscheBahn(DeutscheBahnDepartureModel db) {

    return DesireNearbyModel(
        name: db.line_name,
        stop: db.stationname,
        origin: db.direction,
        time: db.when,
        realtime: db.when,
        source: "DeutscheBahn"
    );
  }
}
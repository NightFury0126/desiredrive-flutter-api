import 'package:desiredrive_api_flutter/models/rmv/rmv_arrival.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';

class DesireNearbyModel {
  final String name;
  final String stop;
  final String origin;
  final String product;
  final DateTime time;
  final DateTime realtime;
  final String source;

  DesireNearbyModel({
    this.name,
    this.stop,
    this.origin,
    this.product,
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
        product: rmv.product,
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
        product: db.line_product,
        source: "DeutscheBahn"
    );
  }

  factory DesireNearbyModel.failure() {

    return DesireNearbyModel(
        name: "ERROR",
        stop: "ERROR",
        origin: "ERROR",
        time: null,
        realtime: null,
        product: null,
        source: "DeutscheBahn"
    );
  }
}
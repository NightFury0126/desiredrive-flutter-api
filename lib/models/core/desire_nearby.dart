import 'package:desiredrive_api_flutter/models/rmv/rmv_departure.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';

class DesireNearbyModel {
  final String name;
  final String stop;
  final String direction;
  final String product;
  final DateTime time;
  final DateTime realtime;
  final String source;

  DesireNearbyModel({
    this.name,
    this.stop,
    this.direction,
    this.product,
    this.time,
    this.realtime,
    this.source
  });

  factory DesireNearbyModel.fromRMV(RMVDepartureModel rmv) {

    return DesireNearbyModel(
        name: rmv.name,
        stop: rmv.stop,
        direction: rmv.direction,
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
        direction: db.direction,
        time: db.when,
        realtime: db.when,
        product: db.line_product,
        source: "DeutscheBahn"
    );
  }
}
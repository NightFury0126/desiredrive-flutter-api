import 'package:desiredrive_api_flutter/models/core/desire_nearby.dart';
import 'package:desiredrive_api_flutter/models/deutschebahn/db_departure.dart';
import 'package:desiredrive_api_flutter/models/rmv/rmv_arrival.dart';

class DesireNearbyMerger {

  List<DesireNearbyModel> _result = [];

  mergeDB(List<DeutscheBahnDepartureModel> model) {
    for (var i in model) {
      _result.add(DesireNearbyModel.fromDeutscheBahn(i));
    }
  }

  mergeRMV(List<RMVArrivalModel> model) {
    for (var i in model) {
      _result.add(DesireNearbyModel.fromRMV(i));
    }
  }

  failure() {
    _result.add(DesireNearbyModel.failure());
  }


  List<DesireNearbyModel> getData() {
    return _result;
  }

}
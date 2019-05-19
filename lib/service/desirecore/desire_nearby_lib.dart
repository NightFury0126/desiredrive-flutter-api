import 'package:desiredrive_api_flutter/service/rmv/rmv_departure_request.dart';
import 'package:desiredrive_api_flutter/service/rmv/rmv_query_request.dart';
import 'package:desiredrive_api_flutter/models/rmv/rmv_query.dart';
import 'package:desiredrive_api_flutter/service/geocode/geocode.dart';
import 'package:desiredrive_api_flutter/service/desirecore/desire_nearby_merger.dart';
import 'package:desiredrive_api_flutter/models/core/desire_nearby.dart';

class DesireNearbyLib {

  Future<List<RMVQueryModel>> getQuery(int max) async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    return RMVQueryRequest.getNearestStations(await geocode.latitude(), await geocode.longitude(), max);
  }

  Future<List<DesireNearbyModel>> getNearby(int index, List<RMVQueryModel> model) async {
    DesireNearbyMerger merger = new DesireNearbyMerger();

    var rmv_arrival_result = await RMVDepartureRequest.getDepartures(model[index].extID);
    merger.mergeRMV(rmv_arrival_result);

    return merger.getData();
  }

  Future<List<DesireNearbyModel>> getSingleNearby(RMVQueryModel model) async {
    DesireNearbyMerger merger = new DesireNearbyMerger();

    var rmv_arrival_result = await RMVDepartureRequest.getMoreDepartures(model.extID);

    merger.mergeRMV(rmv_arrival_result);

    return merger.getData();
  }
}
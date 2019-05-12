import 'package:desiredrive_api_flutter/service/deutschebahn/db_departure_request.dart';
import 'package:desiredrive_api_flutter/service/deutschebahn/db_stations_request.dart';
import 'package:desiredrive_api_flutter/service/rmv/rmv_arrival_request.dart';
import 'package:desiredrive_api_flutter/service/rmv/rmv_query_request.dart';
import 'package:desiredrive_api_flutter/service/nominatim/nominatim_request.dart';
import 'package:desiredrive_api_flutter/service/geocode/geocode.dart';
import 'package:desiredrive_api_flutter/service/desirecore/desire_location_desicion.dart';
import 'package:desiredrive_api_flutter/service/desirecore/desire_nearby_merger.dart';

class DesireNearbyLib {

  getNearby() async {
    DesireDriveGeocode geocode = new DesireDriveGeocode();
    DeutscheBahnDepartureRequest departure = new DeutscheBahnDepartureRequest(
        http_id: 'TPT'
    );
    DeutscheBahnStationsRequest stations = new DeutscheBahnStationsRequest(
        http_id: 'TPT'
    );
    NominatimRequest nominatim = new NominatimRequest();
    DesireLocationDesicion desicion = new DesireLocationDesicion(
        latitude: await geocode.latitude(),
        longitude: await geocode.longitude()
    );
    DesireNearbyMerger merger = new DesireNearbyMerger();
    RMVArrivalRequest arrival = new RMVArrivalRequest();
    RMVQueryRequest rmv_query = new RMVQueryRequest();

    List<String> desicion_result = desicion.desicion;
    var nominatim_result = await nominatim.getPlace(await geocode.latitude(), await geocode.longitude());

    if (desicion_result.contains('deutschebahn')) {
      var db_stations_result = await stations.getMostRelevantStation(nominatim_result.city);
      var db_departure_result = await departure.getDepartures(db_stations_result.id);
      merger.mergeDB(db_departure_result);
    }

    if (desicion_result.contains('rmv')) {
      var rmv_query_result = await rmv_query.getMostRelevantStation(nominatim_result.city);
      var rmv_arrival_result = await arrival.getDepartures(rmv_query_result.id);
      merger.mergeRMV(rmv_arrival_result);
    }

    return merger.data;
  }
}
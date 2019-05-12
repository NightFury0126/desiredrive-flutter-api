import 'package:desiredrive_api_flutter/apikeys.dart';

class RMVConstants {
  static String API_URL = "https://www.rmv.de/hapi/";
  static String API_ARRIVAL = "arrivalBoard?accessId=";
  static String API_QUERY_NAME = "location.name?accessId=";
  static String API_QUERY_COORDINATES = "location.nearbystops?accessId=";
  static String API_KEY = APIKEYS.RMV;
}
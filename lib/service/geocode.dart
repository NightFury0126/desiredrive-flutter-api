import 'package:location/location.dart';

class DesireDriveGeocode {
  Future<Map<String, double>> location() async {
    var locationInit = new Location();
    return await interpreter(locationInit.getLocation());
  }

  Future<Map<String, double>> interpreter(Future<LocationData> location) async {
    return location.then((res) {
      return {
        'latitude': res.latitude,
        'longitude': res.latitude
      };
    });
  }

  Future<double> latitude() async {
    return await location().then((res) {
      return res['latitude'];
    });
  }

  Future<double> longitude() async {
    return await location().then((res) {
      return res['longitude'];
    });
  }
}
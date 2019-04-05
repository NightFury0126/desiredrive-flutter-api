import 'package:location/location.dart';

class DesireDriveGeocode {
  Future<Map<String, double>> location() async {
    var locationInit = new Location();
    return await locationInit.getLocation();
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
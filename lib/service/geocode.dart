import 'package:location/location.dart';

class DesireDriveGeocode {
  DesireDriveGeocode() {
    _locationObtain();
  }

  Map<String, double> userLocation;

  _locationObtain() async {
    var locationInit = new Location();
    try {
      userLocation = await locationInit.getLocation();
    } catch (e) {
      userLocation = null;
    }
  }

  get latitude {
    return userLocation['latitude'].toString();
  }

  get longitude {
    return userLocation['longitude'].toString();
  }
}
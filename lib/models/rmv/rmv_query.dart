class RMVQueryModel {
  final String name;
  final String extID;
  final String id;
  final double lat;
  final double lon;
  final Map<String, dynamic> raw_response;

  RMVQueryModel({
    this.name,
    this.extID,
    this.id,
    this.lat,
    this.lon,
    this.raw_response
  });

  factory RMVQueryModel.fromJson(Map<String, dynamic> json) {
    var json2 = json['StopLocation'];
    return RMVQueryModel(
        name: json2['name'],
        extID: json2['extId'],
        id: json2['id'],
        lat: json2['lat'],
        lon: json2['lon'],
        raw_response: json2
    );
  }

  factory RMVQueryModel.failure() {
    return RMVQueryModel(
        name: "Keine Ergebnisse",
        extID: "",
        id: "",
        lat: 0,
        lon: 0,
        raw_response: null
    );
  }
}
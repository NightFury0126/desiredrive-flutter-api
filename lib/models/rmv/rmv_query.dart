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
    return RMVQueryModel(
        name: json['name'],
        extID: json['extId'],
        id: json['id'],
        lat: json['lat'],
        lon: json['lon'],
        raw_response: json
    );
  }
}
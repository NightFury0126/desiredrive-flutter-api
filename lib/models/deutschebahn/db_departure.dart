class DeutscheBahnDepartureModel {
  final int trip;
  final String tripId;
  final String stop_type;
  final DateTime when;
  final String direction;
  final String line_mode;
  final String line_name;
  final String line_id;
  final String line_drive_id;
  final bool line_isPublic;
  final String line_product;
  final String line_operator;
  final String stationname;
  final String platform;
  final int delay;
  final Map<String, dynamic> raw_response;

  DeutscheBahnDepartureModel({
    this.trip,
    this.tripId,
    this.stop_type,
    this.when,
    this.direction,
    this.line_mode,
    this.line_name,
    this.line_id,
    this.line_drive_id,
    this.line_isPublic,
    this.line_product,
    this.line_operator,
    this.stationname,
    this.platform,
    this.delay,
    this.raw_response
  });

  factory DeutscheBahnDepartureModel.fromJson(Map<String, dynamic> json) {

    return DeutscheBahnDepartureModel(
      trip: json['trip'],
      tripId: json['tripId'],
      stop_type: json['stop']['type'],
      when: DateTime.parse(json['when']),
      direction: json['direction'],
      line_mode: json['line']['mode'],
      line_name: json['line']['name'],
      line_id: json['line']['id'],
      line_drive_id: json['line']['fahrtNr'],
      line_isPublic: json['line']['public'],
      line_product: json['line']['product'],
      line_operator: json['line']['operator']['name'],
      platform: json['platform'] ?? "NaN",
      delay: json['delay'],
      raw_response: json
    );
  }
}
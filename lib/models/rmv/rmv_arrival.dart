class RMVArrivalModel {
  final String name;
  final String stop;
  final String origin;
  final DateTime date;
  final DateTime time;
  final DateTime rtTime;
  final Map<String, dynamic> raw_response;

  RMVArrivalModel({
    this.name,
    this.stop,
    this.origin,
    this.date,
    this.time,
    this.rtTime,
    this.raw_response
  });

  factory RMVArrivalModel.fromJson(Map<String, dynamic> json) {

    return RMVArrivalModel(
        name: json['name'],
        stop: json['stop'],
        origin: json['origin'],
        date: DateTime.parse(json['date']),
        time: DateTime.parse(json['time']),
        rtTime: DateTime.parse(json['rtTime']),
        raw_response: json
    );
  }
}
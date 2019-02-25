class DeutscheBahnCurrentModel {
  final String when;
  final String direction;
  final String mode;
  final String name;
  final String stationname;

  DeutscheBahnCurrentModel({this.when, this.direction, this.mode, this.name, this.stationname});

  factory DeutscheBahnCurrentModel.fromJson(Map<String, dynamic> json) {
    return DeutscheBahnCurrentModel(
      when: json['when'],
      direction: json['direction'],
      mode: json['line']['mode'],
      name: json['line']['name'],
      stationname: json['station']['name']
    );
  }
}
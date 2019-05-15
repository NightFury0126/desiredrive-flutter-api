class RMVArrivalModel {
  final String name;
  final String stop;
  final String origin;
  final String product;
  final DateTime date;
  final DateTime time;
  final DateTime rtTime;
  final Map<String, dynamic> raw_response;

  RMVArrivalModel({
    this.name,
    this.stop,
    this.origin,
    this.product,
    this.date,
    this.time,
    this.rtTime,
    this.raw_response
  });

  factory RMVArrivalModel.fromJson(Map<String, dynamic> json) {

    return RMVArrivalModel(
        name: json['name'] ,
        stop: json['stop'],
        origin: json['origin'],
        product: json['Product']['catOutL'],
        date: DateTime.parse(json['date']),
        time: rmvDateCreator(json['time']),
        rtTime: rmvDateCreator(checkRTNull(json)),
        raw_response: json
    );
  }

  static checkRTNull(json) {
    if (json['rtTime'] == null)
      return json['time'];
    else
      return json['rtTime'];
  }

  static DateTime rmvDateCreator(String time) {
    var now = DateTime.now();

    return DateTime.parse(now.year.toString() + "-" + now.month.toString().padLeft(2, '0') + "-" + now.day.toString().padLeft(2, '0') + " " + time);
  }
}
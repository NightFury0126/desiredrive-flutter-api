class NominatimPlaceModel {
  final String city;
  final String county;
  final String postcode;
  final String state;
  final Map<String, dynamic> raw_response;

  NominatimPlaceModel({
    this.city,
    this.county,
    this.postcode,
    this.state,
    this.raw_response
  });

  factory NominatimPlaceModel.fromJson(Map<String, dynamic> json) {

    return NominatimPlaceModel(
      city: json['address']['city'],
      county: json['address']['county'],
      postcode: json['address']['postcode'],
      state: json['address']['state'],
      raw_response: json
    );
  }
}
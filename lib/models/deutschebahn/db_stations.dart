class DeutscheBahnStationsModel {
  final String id;
  final double relevance;
  final double score;
  final double weight;
  final String type;
  final int number;
  final String name;
  final double latitude;
  final double longitude;
  final String operator;
  final String city;
  final String street;
  final String zipcode;
  final bool parking;
  final bool bicycle_parking;
  final bool local_public_transport;
  final bool public_facilities;
  final bool locker_system;
  final bool taxi_rank;
  final bool travel_necessities;
  final String stepless_access;
  final String mobility_service;
  final bool wifi;
  final bool travel_center;
  final bool railway_mission;
  final bool db_lounge;
  final bool lost_and_found;
  final bool car_rental;
  final String federalState;
  final String region_section;
  final String phone_number;
  final Map<String, dynamic> raw_response;

  DeutscheBahnStationsModel({
    this.id,
    this.relevance,
    this.score,
    this.weight,
    this.type,
    this.number,
    this.name,
    this.latitude,
    this.longitude,
    this.operator,
    this.city,
    this.street,
    this.zipcode,
    this.parking,
    this.bicycle_parking,
    this.local_public_transport,
    this.public_facilities,
    this.locker_system,
    this.taxi_rank,
    this.travel_necessities,
    this.stepless_access,
    this.mobility_service,
    this.wifi,
    this.travel_center,
    this.railway_mission,
    this.db_lounge,
    this.lost_and_found,
    this.car_rental,
    this.federalState,
    this.region_section,
    this.phone_number,
    this.raw_response
  });

  factory DeutscheBahnStationsModel.fromJson(Map<String, dynamic> json) {
    return DeutscheBahnStationsModel(
      id: json['id'],
      relevance: json['relevance'],
      score: json['score'],
      weight: json['weight'],
      type: json['type'],
      number: json['number'],
      name: json['name'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
      operator: json['operator']['name'],
      city: json['address']['city'],
      street: json['address']['street'],
      zipcode: json['address']['zipcode'],
      parking: json['hasParking'],
      bicycle_parking: json['hasBicycleParking'],
      local_public_transport: json['hasLocalPublicTransport'],
      public_facilities: json['hasPublicFacilities'],
      locker_system: json['hasLockerSystem'],
      taxi_rank: json['hasTaxiRank'],
      travel_necessities: json['hasTravelNecessities'],
      stepless_access: json['hasSteplessAccess'],
      mobility_service: json['hasMobilityService'],
      wifi: json['hasWiFi'],
      travel_center: json['hasTravelCenter'],
      railway_mission: json['hasRailwayMission'],
      db_lounge: json['hasDBLounge'],
      lost_and_found: json['hasLostAndFound'],
      car_rental: json['hasCarRental'],
      federalState: json['federalState'],
      region_section: json['regionalbereich']['name'],
      phone_number: json['publicPhoneNumber'] ?? "N/A",
      raw_response: json
    );
  }
}
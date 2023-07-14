import 'package:untitled/models/airline/airline.dart';
import 'package:json_annotation/json_annotation.dart';
part 'passenger.g.dart';

@JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: true)
class Passenger {
  Passenger({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  String id;
  String name;
  int trips;
  List<Airline> airline;
  int v;

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$passengerFromJSON(json);

  Map<String, dynamic> toJson() => _$passengerToJSON(this);
}

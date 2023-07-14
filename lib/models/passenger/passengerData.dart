import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/models/passenger/passenger.dart';
part 'passengerData.g.dart';

@JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: true)
class PassengersData {
  PassengersData({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  final int totalPassengers;
  final int totalPages;
  final List<Passenger> data;

  factory PassengersData.fromJson(Map<String, dynamic> json) =>
      _$passengerDataFromJSON(json);

  Map<String, dynamic> toJson() => _$passengerDataToJSON(this);
}

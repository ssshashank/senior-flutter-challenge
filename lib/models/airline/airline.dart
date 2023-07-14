import 'package:json_annotation/json_annotation.dart';
part 'airline.g.dart';

@JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: true)
class Airline {
  Airline({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
  });

  int id;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$airlineFromJSON(json);

  Map<String, dynamic> toJson() => _$airlineToJSON(this);
}

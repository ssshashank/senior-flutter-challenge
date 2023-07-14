part of 'airline.dart';

Airline _$airlineFromJSON(Map<String, dynamic> json) => Airline(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      logo: json["logo"],
      slogan: json["slogan"],
      headQuaters: json["head_quaters"],
      website: json["website"],
      established: json["established"],
    );

Map<String, dynamic> _$airlineToJSON(Airline instance) => {
      "id": instance.id,
      "name": instance.name,
      "country": instance.country,
      "logo": instance.logo,
      "slogan": instance.slogan,
      "head_quaters": instance.headQuaters,
      "website": instance.website,
      "established": instance.established,
    };

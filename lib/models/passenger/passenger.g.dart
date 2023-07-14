part of 'passenger.dart';

Passenger _$passengerFromJSON(Map<String, dynamic> json) => Passenger(
      id: json["_id"],
      name: json["name"],
      trips: json["trips"],
      airline:
          List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
      v: json["__v"],
    );

Map<String, dynamic> _$passengerToJSON(Passenger instance) => {
      "_id": instance.id,
      "name": instance.name,
      "trips": instance.trips,
      "airline": List<dynamic>.from(instance.airline.map((x) => x.toJson())),
      "__v": instance.v,
    };

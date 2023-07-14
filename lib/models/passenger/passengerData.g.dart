part of 'passengerData.dart';

PassengersData _$passengerDataFromJSON(Map<String, dynamic> json) =>
    PassengersData(
      totalPassengers: json["totalPassengers"],
      totalPages: json["totalPages"],
      data:
          List<Passenger>.from(json["data"].map((x) => Passenger.fromJson(x))),
    );

Map<String, dynamic> _$passengerDataToJSON(instance) => {
      "totalPassengers": instance.totalPassengers,
      "totalPages": instance.totalPages,
      "data": List<dynamic>.from(instance.data.map((x) => x.toJson())),
    };

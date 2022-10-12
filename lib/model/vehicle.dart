class GetVehicleResponse {
  GetVehicleResponse({
    required this.error,
    required this.message,
    required this.result,
  });

  bool error;
  String message;
  List<Vehicle> result;

  factory GetVehicleResponse.fromJson(Map<String, dynamic> json) =>
      GetVehicleResponse(
        error: json["error"],
        message: json["message"],
        result: List<Vehicle>.from(
          json["result"].map(
            (x) => Vehicle.fromJson(x),
          ),
        ),
      );
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.idUser,
    required this.brand,
    required this.model,
    required this.color,
    required this.noPolisi,
    required this.jenis,
  });

  String id;
  String idUser;
  String brand;
  String model;
  String color;
  String noPolisi;
  String jenis;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        idUser: json["id_user"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        noPolisi: json["no_polisi"],
        jenis: json["jenis"],
      );
}

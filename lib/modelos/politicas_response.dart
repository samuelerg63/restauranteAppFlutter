// To parse this JSON data, do
//
//     final politicasResponse = politicasResponseFromMap(jsonString);

import 'dart:convert';

class PoliticasResponse {
  PoliticasResponse({
    required this.datos,
  });

  Politicas datos;

  factory PoliticasResponse.fromJson(String str) =>
      PoliticasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PoliticasResponse.fromMap(Map<String, dynamic> json) =>
      PoliticasResponse(
        datos: Politicas.fromMap(json["datos"]),
      );

  Map<String, dynamic> toMap() => {
        "datos": datos.toMap(),
      };
}

class Politicas {
  Politicas({
    required this.politicas,
  });

  String politicas;

  factory Politicas.fromJson(String str) => Politicas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Politicas.fromMap(Map<String, dynamic> json) => Politicas(
        politicas: json["politicas"],
      );

  Map<String, dynamic> toMap() => {
        "politicas": politicas,
      };
}

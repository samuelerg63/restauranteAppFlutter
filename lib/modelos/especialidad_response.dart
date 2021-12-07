// To parse this JSON data, do
//
//     final especialidadResponse = especialidadResponseFromMap(jsonString);

import 'dart:convert';

class EspecialidadResponse {
  EspecialidadResponse({
    required this.datos,
  });

  Especialidad datos;

  factory EspecialidadResponse.fromJson(String str) =>
      EspecialidadResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory EspecialidadResponse.fromMap(Map<String, dynamic> json) =>
      EspecialidadResponse(
        datos: Especialidad.fromMap(json["datos"]),
      );
}

class Especialidad {
  Especialidad({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.urlFoto,
  });

  String nombre;
  String descripcion;
  int precio;
  String urlFoto;

  get fullNombreEspecialidad {
    if (nombre != null) {
      return nombre;
    } else {
      return 'sin nombre';
    }
  }

  factory Especialidad.fromJson(String str) =>
      Especialidad.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Especialidad.fromMap(Map<String, dynamic> json) => Especialidad(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        urlFoto: json["url_foto"],
      );
}

// To parse this JSON data, do
//
//     final categoriasResponse = categoriasResponseFromMap(jsonString);

import 'dart:convert';

class CategoriasResponse {
  CategoriasResponse({
    required this.datos,
  });

  List<DatoCategoria> datos;

  factory CategoriasResponse.fromJson(String str) =>
      CategoriasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriasResponse.fromMap(Map<String, dynamic> json) =>
      CategoriasResponse(
        datos: List<DatoCategoria>.from(
            json["datos"].map((x) => DatoCategoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "datos": List<dynamic>.from(datos.map((x) => x.toMap())),
      };
}

class DatoCategoria {
  DatoCategoria({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.urlImagen,
  });

  int id;
  String nombre;
  String descripcion;
  String urlImagen;

  get fullImgCategoria {
    if (urlImagen != null) return urlImagen;
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory DatoCategoria.fromJson(String str) =>
      DatoCategoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatoCategoria.fromMap(Map<String, dynamic> json) => DatoCategoria(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        urlImagen: json["url_imagen"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "url_imagen": urlImagen,
      };
}

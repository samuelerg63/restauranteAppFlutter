// To parse this JSON data, do
//
//     final prodcutCatResponse = prodcutCatResponseFromMap(jsonString);

import 'dart:convert';

class ProdcutCatResponse {
  ProdcutCatResponse({
    required this.nombre,
    required this.descripcion,
    required this.productos,
  });

  String nombre;
  String descripcion;
  List<ProductoCat> productos;

  factory ProdcutCatResponse.fromJson(String str) =>
      ProdcutCatResponse.fromMap(json.decode(str));

  factory ProdcutCatResponse.fromMap(Map<String, dynamic> json) =>
      ProdcutCatResponse(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        productos: List<ProductoCat>.from(
            json["productos"].map((x) => ProductoCat.fromMap(x))),
      );
}

class ProductoCat {
  ProductoCat({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.urlImagen,
  });

  int id;
  String nombre;
  String descripcion;
  int precio;
  String urlImagen;

  get fullImgProducto {
    if (urlImagen.isEmpty) {
      return urlImagen;
    } else {
      return 'https://via.placeholder.com/400x400';
    }
  }

  factory ProductoCat.fromJson(String str) =>
      ProductoCat.fromMap(json.decode(str));

  factory ProductoCat.fromMap(Map<String, dynamic> json) => ProductoCat(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        urlImagen: json["url_imagen"],
      );
}

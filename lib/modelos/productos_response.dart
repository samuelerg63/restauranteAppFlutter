// To parse this JSON data, do
//
//     final productosResponse = productosResponseFromMap(jsonString);

import 'dart:convert';

class ProductosResponse {
  ProductosResponse({
    required this.productos,
  });

  List<Producto> productos;

  factory ProductosResponse.fromJson(String str) =>
      ProductosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductosResponse.fromMap(Map<String, dynamic> json) =>
      ProductosResponse(
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}

class Producto {
  Producto({
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

  get fullNombresProducto {
    if (nombre != null) {
      return nombre;
    } else {
      return 'No tiene nombre de producto';
    }
  }

  get fullDescripcionProducto {
    if (descripcion != null) {
      return descripcion;
    } else {
      return 'este producto no tiene descripción';
    }
  }

  get fullPrecio {
    if (precio != null) {
      return precio;
    } else {
      return 0;
    }
  }

  get fullImagenProductos {
    if (urlImagen != null) {
      return urlImagen;
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        urlImagen: json["url_imagen"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "url_imagen": urlImagen,
      };
}

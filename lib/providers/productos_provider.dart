import 'package:app_restaurante/modelos/productos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductosProvider extends ChangeNotifier {
  final String _baseUrl = 'wsc.fabricasoftware.co';

  List<Producto> listaProducto = [];

  ProductosProvider() {
    print('Productos provider inicializado');
    getProductos();
  }

  //metodo para llamar http
  getProductos() async {
    var url = Uri.https(_baseUrl, 'api/productos', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //llamando instancia de respuesta
    final datoProductosResponse = ProductosResponse.fromJson(response.body);
    //decodificar a mapa
    //print(DatoCategoriaResponse.datos[0].urlImagen);
    listaProducto = datoProductosResponse.productos;
    notifyListeners();
  }
}

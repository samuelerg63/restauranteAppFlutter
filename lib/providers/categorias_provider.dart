import 'dart:async';

import 'package:app_restaurante/global/global.dart';
import 'package:app_restaurante/modelos/categ_prod_response.dart';
import 'package:app_restaurante/modelos/categorias_response.dart';
import 'package:app_restaurante/modelos/especialidad_response.dart';
import 'package:app_restaurante/modelos/productos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriasProvider extends ChangeNotifier {
  final String _baseUrl = 'wsc.fabricasoftware.co';

  List<DatoCategoria> listaCategorias = [];
  List<Producto> listaProductos = [];
  //Especialidad especialidad;
  Map<int, List<ProductoCat>> producoCategoria = {};
  List<ProductoCat> listaProductCat = [];

  CategoriasProvider() {
    print('Categorias provider inicializado');
    getCategorias();
    getProductos();
    //getEspecialidad();
    getProductCategoria(categoriaIds);
  }

  //metodo para llamar http
  getCategorias() async {
    var url = Uri.https(_baseUrl, 'api/categorias', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //llamando instancia de respuesta
    final datoCategoriaResponse = CategoriasResponse.fromJson(response.body);
    //decodificar a mapa
    //print(DatoCategoriaResponse.datos[0].urlImagen);
    listaCategorias = datoCategoriaResponse.datos;
    notifyListeners();
  }

  getProductos() async {
    var url = Uri.https(_baseUrl, 'api/productos', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //llamando instancia de respuesta
    final datoProductosResponse = ProductosResponse.fromJson(response.body);
    //decodificar a mapa
    //print(DatoProductosResponse.productos[0].nombre);
    //print(DatoCategoriaResponse.datos[0].urlImagen);
    listaProductos = datoProductosResponse.productos;
    notifyListeners();
  }
/*
  getEspecialidad() async {
    var url = Uri.https(_baseUrl, 'api/especialidad', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    //final response = await http.get(url);
    //llamando instancia de respuesta

    //final respEspecialidadResponse =
    //  EspecialidadResponse.fromJson(response.body);

    //especialidad = respEspecialidadResponse.datos;
    //print(respEspecialidadResponse.datos.nombre);
    notifyListeners();
  }*/

  Future<List<ProductoCat>> getProdCategoria(int categoriaId) async {
    print('pidiendo info al server de los productos');

    var url = Uri.https(_baseUrl, 'api/categorias/$categoriaId', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //final jsonData = await this._getJsonData('api/categorias', categoriaId);
    final productosCatResponse = ProdcutCatResponse.fromJson(response.body);

    producoCategoria[categoriaId] = productosCatResponse.productos;
    return productosCatResponse.productos;
  }

  getProductCategoria(int idCategoria) async {
    var url = Uri.https(_baseUrl, 'api/categorias/$idCategoria', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //llamando instancia de respuesta
    final respProducCatResponse = ProdcutCatResponse.fromJson(response.body);

    listaProductCat = respProducCatResponse.productos;

    notifyListeners();
  }
}

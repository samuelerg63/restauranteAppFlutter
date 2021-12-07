import 'package:app_restaurante/modelos/productos_response.dart';
import 'package:flutter/material.dart';

class ProductsSlider extends StatelessWidget {
  final List<Producto> productos;

  const ProductsSlider({Key? key, required this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.productos.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.6,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {}

    return Container(
      width: double.infinity,
      height: 300,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Productos principales:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productos.length,
              itemBuilder: (BuildContext context, int index) =>
                  _PlatosPrincipales(producto: productos[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatosPrincipales extends StatelessWidget {
  final Producto producto;
  const _PlatosPrincipales({Key? key, required this.producto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail_food',
                arguments: producto),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(producto.fullImagenProductos),
                height: 180,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 150,
            height: 35,
            child: Text(
              producto.fullNombresProducto,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 20,
            child: Text(
              producto.precio.toString() + ' COP',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app_restaurante/modelos/categ_prod_response.dart';
import 'package:app_restaurante/modelos/productos_response.dart';
import 'package:app_restaurante/providers/categorias_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCard extends StatelessWidget {
  final int idCategoria;

  // ignore: use_key_in_widget_constructors
  const ProductsCard(this.idCategoria);

  @override
  Widget build(BuildContext context) {
    final categoriasProvider =
        Provider.of<CategoriasProvider>(context, listen: false);

    return FutureBuilder(
      future: categoriasProvider.getProdCategoria(idCategoria),
      builder: (_, AsyncSnapshot<List<ProductoCat>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final List<ProductoCat> productos = snapshot.data!;
        final List<Producto> producto = categoriasProvider.listaProductos;
        return Container(
          //contenedor que va a alohjar todas los actores
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 350,
          //color: Colors.red,
          child: ListView.builder(
            itemCount: productos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return _CastCard(productos[index], producto[index]);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard(this.producto, this.product);
  final Producto product;
  final ProductoCat producto;
  @override
  Widget build(BuildContext context) {
    return Container(
      //creamos el contenedor que va a alojar cada actor
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 180,
      height: 270,
      //color: Colors.green,
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detail_food', arguments: product),
            child: ClipRRect(
              //creamos la imagen
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(producto.urlImagen),
                placeholder: const AssetImage('assets/no-image.jpg'),
                height: 250,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            child: Text(
              producto.nombre,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '\$ ' + producto.precio.toString() + ' COP',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}

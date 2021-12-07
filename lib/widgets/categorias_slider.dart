import 'package:app_restaurante/modelos/categorias_response.dart';

import 'package:flutter/material.dart';

class CategoriasSlider extends StatelessWidget {
  final List<DatoCategoria> categorias;
  const CategoriasSlider({Key? key, required this.categorias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.categorias.length == 0) {
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
              'Categorias principales:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (BuildContext context, int index) =>
                  _CategoriasPrincipales(categoria: categorias[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriasPrincipales extends StatelessWidget {
  final DatoCategoria categoria;
  const _CategoriasPrincipales({Key? key, required this.categoria})
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
            onTap: () => Navigator.pushNamed(context, 'detail_category',
                arguments: categoria),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(categoria.urlImagen),
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
              categoria.nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

import 'package:app_restaurante/modelos/categorias_response.dart';
import 'package:app_restaurante/providers/categorias_provider.dart';
import 'package:app_restaurante/widgets/productos_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsCategory extends StatelessWidget {
  //final Desayunos desayuno;
  const DetailsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasProvider = Provider.of<CategoriasProvider>(context);

    final DatoCategoria categoria =
        ModalRoute.of(context)!.settings.arguments as DatoCategoria;

    return Scaffold(
      //el customscroll view recibe slivers, los slivers son widgets que tienen comportamiento cuando se hace scroll
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(
            categoria: categoria,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(
                  categoria: categoria,
                ),
                _TextoGeneral(categoria: categoria),
                const SizedBox(
                  height: 10,
                ),
                ProductsCard(
                  categoria.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final DatoCategoria categoria;
  const _CustomAppbar({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepOrangeAccent[600],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(categoria.nombre),
          color: Colors.black12,
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.gif'),
          image: NetworkImage(categoria.urlImagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final DatoCategoria categoria;
  const _PosterAndTitle({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(categoria.urlImagen),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoria.nombre,
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Ahorras un 45%',
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '5.9',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _TextoGeneral extends StatelessWidget {
  final DatoCategoria categoria;
  const _TextoGeneral({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        categoria.descripcion,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

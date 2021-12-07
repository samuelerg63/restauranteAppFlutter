import 'package:app_restaurante/modelos/productos_response.dart';
import 'package:flutter/material.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Producto food =
        ModalRoute.of(context)!.settings.arguments as Producto;

    return Scaffold(
      //el customscroll view recibe slivers, los slivers son widgets que tienen comportamiento cuando se hace scroll
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(producto: food),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(producto: food),
                _TextoGeneral(producto: food),
                _BotonAdd(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonAdd extends StatelessWidget {
  const _BotonAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(60),
      width: double.infinity,
      height: 200,
      //color: Colors.red,
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.deepOrangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Agregar al carrito',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({Key? key, required this.producto}) : super(key: key);

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepOrangeAccent[600],
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(producto.nombre),
          color: Colors.black12,
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.gif'),
          image: NetworkImage(producto.urlImagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Producto producto;
  const _PosterAndTitle({Key? key, required this.producto}) : super(key: key);

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
              image: NetworkImage(producto.urlImagen),
              height: 100,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                producto.nombre,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '35% OFF \$' + producto.precio.toString() + ' COP',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
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
  final Producto producto;
  const _TextoGeneral({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        producto.descripcion,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

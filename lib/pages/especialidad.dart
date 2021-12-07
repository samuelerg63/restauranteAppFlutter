import 'package:flutter/material.dart';

class EspecialidadPage extends StatelessWidget {
  const EspecialidadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //el customscroll view recibe slivers, los slivers son widgets que tienen comportamiento cuando se hace scroll
      body: CustomScrollView(
        slivers: [
          const _CustomAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const _PosterAndTitle(),
                const _TextoGeneral(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({Key? key}) : super(key: key);

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
          child: const Text('Especialidades'),
          color: Colors.black12,
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/placeholder.gif'),
          image: NetworkImage(
              'https://elrancherito.com.co/wp-content/uploads/2020/06/FotosWeb_Rancherito-04-600x600.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  "https://elrancherito.com.co/wp-content/uploads/2020/06/FotosWeb_Rancherito-04-600x600.png"),
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
                'Bandeja montañera',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '21400 COP',
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
  const _TextoGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Con frijol, carne asada, carne molida o chicharrón, huevo frito, papa, yuca, ensalada, tajada de maduro, arroz y arepa.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

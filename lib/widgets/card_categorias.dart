import 'package:app_restaurante/global/global.dart';

import 'package:app_restaurante/modelos/categorias_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardCategorias extends StatelessWidget {
  final List<DatoCategoria> lista;

  const CardCategorias({Key? key, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.lista.length == 0) {
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
      height: size.height * 0.4,
      //color: Colors.red,
      child: Swiper(
        itemCount: 3,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.7,
        itemBuilder: (BuildContext context, int index) {
          final categImg = lista[index];
          categoriaIds = categImg.id;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail_category',
                arguments: categImg),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/placeholder.gif'),
                image: NetworkImage(categImg.fullImgCategoria),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

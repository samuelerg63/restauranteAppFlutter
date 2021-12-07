import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        //columna que aplia widget uno encima de otro

        children: [
          const _OrangeBox(),
          const _Logo(),
          child,
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Image(
          width: 150,
          height: 150,
          image: AssetImage(
            'assets/logo.png',
          ),
        ),
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  const _OrangeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //podemos indicar que porsentaje de la pantalla usara el contenedor
    return Container(
      width: double.infinity,
      height:
          size.height * 0.4, //indicamos que necesitamos el 40% de la pantalla
      decoration: _colorBackground(),
      child: Stack(
        children: const [
          Positioned(
            child: _Globos(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Globos(),
            top: -20,
            left: -35,
          ),
          Positioned(
            child: _Globos(),
            top: 10,
            right: -28,
          ),
          Positioned(
            child: _Globos(),
            bottom: 45,
            left: 127,
          ),
          Positioned(
            child: _Globos(),
            bottom: -38,
            right: 46,
          ),
        ],
      ),
    );
  }

  BoxDecoration _colorBackground() => const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(255, 117, 57, 1),
          Color.fromRGBO(71, 17, 0, 1),
        ],
      ));
}

class _Globos extends StatelessWidget {
  const _Globos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}

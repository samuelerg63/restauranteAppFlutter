import 'package:app_restaurante/global/cliente.dart';
import 'package:app_restaurante/providers/categorias_provider.dart';
import 'package:app_restaurante/services/services.dart';
import 'package:app_restaurante/widgets/enunciado.dart';
import 'package:app_restaurante/widgets/productos_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_restaurante/widgets/widgets.dart';

import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasProvider = Provider.of<CategoriasProvider>(context);
    final Cliente cliente = Cliente();
    print(cliente.correo);
    //print(categoriasProvider.listaCategorias);

    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      drawer: DrawerInicial(),
      appBar: AppBar(
        title: const Text('Menú de productos'),
        actions: [
          IconButton(
            onPressed: () {
              authService.logout();

              //Navigator.pushReplacementNamed(context, 'splash_screen');
              Future.delayed(
                const Duration(seconds: 3),
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Enunciado(),
            CardCategorias(lista: categoriasProvider.listaCategorias),
            const SizedBox(
              height: 20,
            ),
            ProductsSlider(
              productos: categoriasProvider.listaProductos,
            ),
            const SizedBox(height: 20),
            CategoriasSlider(categorias: categoriasProvider.listaCategorias),
          ],
        ),
      ),
    );
  }
}

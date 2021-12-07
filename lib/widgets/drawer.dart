import 'package:app_restaurante/pages/screens.dart';
import 'package:app_restaurante/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerInicial extends StatelessWidget {
  const DrawerInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              color: Colors.orange,
            ),
            title: const Text('Politicas de servicio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'politicas');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.architecture,
              color: Colors.orange,
            ),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'pedidos');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.orange,
            ),
            title: const Text('Configuración'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.close_rounded,
              color: Colors.orange,
            ),
            title: const Text('Cerrar Sesión'),
            onTap: () {
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
          ),
        ],
      ),
    );
  }
}

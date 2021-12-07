import 'package:app_restaurante/pages/screens.dart';
import 'package:app_restaurante/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarraAppbar extends StatelessWidget {
  const BarraAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return AppBar(
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
    );
  }
}

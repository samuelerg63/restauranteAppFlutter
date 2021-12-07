import 'package:app_restaurante/pages/screens.dart';
import 'package:app_restaurante/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) return const Text('espere');

          if (snapshot.data == '') {
            Future.microtask(() => {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const LoginScreen(),
                        transitionDuration: const Duration(seconds: 5)),
                  )
                  //Navigator.of(context).pushReplacementNamed('home'),
                });
          } else {
            Future.microtask(() => {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomeScreen(),
                        transitionDuration: const Duration(seconds: 5)),
                  )
                  //Navigator.of(context).pushReplacementNamed('home'),
                });
          }

          return Container();
        },
      ),
    ));
  }
}

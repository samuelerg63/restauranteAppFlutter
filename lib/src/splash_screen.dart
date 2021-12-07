import 'package:app_restaurante/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../pages/screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
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
            const Spacer(),
            const Center(
              child: FractionallySizedBox(
                widthFactor: .6,
                child: FadeInImage(
                  image: AssetImage('assets/logo.png'),
                  placeholder: AssetImage('assets/loading2.gif'),
                ),
              ),
            ),
            const Spacer(),
            const Image(
              image: AssetImage('assets/loading2.gif'),
            ),
            //CircularProgressIndicator(),
            const Spacer(),
            const Text('Bienvenido / Wellcome '),
          ],
        ),
      ),
    );
  }
}

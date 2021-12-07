import 'package:app_restaurante/pages/check_out_screen.dart';
import 'package:app_restaurante/pages/delails_category.dart';
import 'package:app_restaurante/pages/detail_food.dart';
import 'package:app_restaurante/pages/especialidad.dart';
import 'package:app_restaurante/pages/pedidos_page.dart';
import 'package:app_restaurante/pages/politicas_page.dart';
import 'package:app_restaurante/pages/register_screen.dart';
import 'package:app_restaurante/services/auth_service.dart';
import 'package:app_restaurante/providers/categorias_provider.dart';
import 'package:app_restaurante/services/notifications_service.dart';
import 'package:provider/provider.dart';
import '../pages/screens.dart';
import 'package:flutter/material.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoriasProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante',
      initialRoute: 'checking',
      routes: {
        //'splash_screen': (_) => Splash_Screen(),
        'login_screen': (_) => const LoginScreen(),
        'home_page': (_) => const HomeScreen(),
        'register': (_) => const RegisterScreen(),
        'checking': (_) => const CheckAuthScreen(),
        'detail_category': (_) => const DetailsCategory(),
        'detail_food': (_) => const DetailFood(),
        'especialidad': (_) => const EspecialidadPage(),
        'politicas': (_) => const PoliticasPage(),
        'pedidos': (_) => const PedidosPage(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light() //cambiamos color de fondo de pantalla a gris
          .copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(color: Colors.deepOrange),
      ),
    );
  }
}

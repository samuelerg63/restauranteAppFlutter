import 'package:app_restaurante/pages/screens.dart';
import 'package:app_restaurante/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoliticasPage extends StatelessWidget {
  const PoliticasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Politicas de servicio'),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: Text(
          'Entiendo que, en consecuencia, el Restaurante es responsable por asegurar la concordancia entre los datos que le han sido suministrado y los que registra/divulga, pero no tiene ninguna responsabilidad por la calidad y veracidad de los datos reportados.\nEs claro para mí que, por medio de esta consulta de datos, el Restaurante pone a mi alcance los mecanismos necesarios para que pueda ejercer el derecho de habeas data, de acuerdo con lo establecido en el artículo 15 de la Constitución Política de Colombia, la Ley 1581 de 2012 y de acuerdo con la doctrina de la Corte Constitucional de Colombia.\nPuede consultar nuestra Política de Privacidad y Protección de Datos Personales',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

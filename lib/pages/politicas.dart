import 'package:app_restaurante/modelos/politicas_response.dart';
import 'package:app_restaurante/providers/categorias_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoliticasPage extends StatelessWidget {
  const PoliticasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriasProvider = Provider.of<CategoriasProvider>(context);
    final Politicas politicas;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(''),
        ],
      ),
      body: Container(
        child: Column(
          children: const [
            Text('Politicas del servicio'),
          ],
        ),
      ),
    );
  }
}

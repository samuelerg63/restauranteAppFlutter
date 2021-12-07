import 'package:flutter/material.dart';

class PedidoCard extends StatelessWidget {
  const PedidoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 50),
      width: double.infinity,
      height: 300,
      color: Colors.red,
    );
  }
}

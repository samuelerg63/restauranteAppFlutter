import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        //color: Colors.amber,
        height: 200,
        width: 200,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}

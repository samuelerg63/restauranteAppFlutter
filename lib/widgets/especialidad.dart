import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        const Image(
          image: NetworkImage('https://via.placeholder.com/300x300'),
          height: 65.0,
          width: 65.0,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Hambuerguesa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Text('43 tipos')
          ],
        ),
      ]),
    );
  }
}

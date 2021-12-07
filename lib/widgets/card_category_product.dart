import 'package:flutter/material.dart';

class CardsCategoryProduct extends StatelessWidget {
  const CardsCategoryProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 270,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 180,
            height: 260,
            color: Colors.red,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const FadeInImage(
                    height: 200,
                    placeholder: AssetImage('assets/placeholder.gif'),
                    image: NetworkImage('https://via.placeholder.com/300x300'),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text('Nombre plato'),
                const SizedBox(
                  height: 5,
                ),
                const Text('precio')
              ],
            ),
          ),
          Container(
            width: 180,
            height: 260,
            color: Colors.red,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const FadeInImage(
                    height: 200,
                    placeholder: AssetImage('assets/placeholder.gif'),
                    image: NetworkImage('https://via.placeholder.com/300x300'),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text('Nombre plato'),
                const SizedBox(
                  height: 5,
                ),
                const Text('precio')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

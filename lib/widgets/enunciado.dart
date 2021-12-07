import 'package:flutter/material.dart';

class Enunciado extends StatelessWidget {
  const Enunciado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              Text(
                '¿Que deseas ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'comer hoy?',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'especialidad'),
            child: Card(
              color: Colors.deepOrangeAccent[100],
              child: Row(
                children: [
                  const Image(
                    image: NetworkImage(
                        "https://elrancherito.com.co/wp-content/uploads/2020/06/FotosWeb_Rancherito-04-600x600.png"),
                    height: 65.0,
                    width: 65.0,
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Especialidad',
                          style: Theme.of(context).textTheme.subtitle2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Bandeja montañera',
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoboItem extends StatelessWidget {
  final String nome;
  final int index;
  final String imagePath;

  const RoboItem({Key key, this.nome, this.index, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(81, 173, 207, 1),
                  width: 650,
                  child: Text(
                    nome,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          image:
              DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.fill),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Tittle extends StatelessWidget {
  const Tittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Камень, ножницы, бумага",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

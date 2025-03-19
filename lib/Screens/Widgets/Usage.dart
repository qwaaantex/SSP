import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Usage extends StatelessWidget {
  const Usage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      title: Text(
        "Как играть?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),

            child: Text(
              "Хорошо",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: Text(
          "В классической игре участвуют два игрока.\nКаждый игрок одновременно показывает одну из трех фигур: камень, ножницы или бумага.\n«Камень» побеждает «ножницы» («камень ломает ножницы»).\n«Ножницы» побеждают «бумагу» («ножницы режут бумагу»).\n«Бумага» побеждает «камень» («бумага обертывает камень»).\nЕсли оба игрока показывают одинаковую фигуру, это ничья.",
          style: TextStyle(color: Colors.grey, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Usage extends StatelessWidget {
  const Usage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: Colors.transparent,

      icon: Icon(Ionicons.help_circle, color: Colors.grey, size: 30),
      title: Text(
        "Как играть?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),

      content: Column(
        children: [
          Text(
            "Каждый игрок одновременно показывает одну из трех фигур: камень, ножницы или бумага.\n«Камень» побеждает «ножницы» («камень ломает ножницы»).\n«Ножницы» побеждают «бумагу» («ножницы режут бумагу»).\n«Бумага» побеждает «камень» («бумага обертывает камень»).\nЕсли оба игрока показывают одинаковую фигуру, это ничья.",
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
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
      ),
    );
  }
}

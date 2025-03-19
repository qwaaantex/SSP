import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Created extends StatelessWidget {
  const Created({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Text(
            "Создано с целью пет-проекта для портфолио",
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          Text(
            "Никакой коммерческой деятельности!",
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

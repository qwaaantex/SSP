import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tittle extends StatefulWidget {
  const Tittle({super.key});

  @override
  State<Tittle> createState() => _TittleState();
}

class _TittleState extends State<Tittle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SSP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 2),
          Container(
            alignment: Alignment.topRight,
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.green,
            ),

            child: Center(
              child: Text(
                "AI",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

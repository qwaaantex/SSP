import 'package:flutter/material.dart';

class ListDots extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDotsState();
}

class ListDotsState extends State<ListDots> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

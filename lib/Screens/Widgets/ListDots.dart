import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';

class ListDots extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDotsState();
}

class ListDotsState extends State<ListDots> {
  @override
  Widget build(BuildContext context) {
    ProviderGame _provider = Provider.of<ProviderGame>(context);
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 8,
            width: _provider.indexFocusedVariants == 0 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexFocusedVariants == 0
                      ? Colors.green
                      : Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 8,
            width: _provider.indexFocusedVariants == 1 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexFocusedVariants == 1
                      ? Colors.green
                      : Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 8,
            width: _provider.indexFocusedVariants == 2 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexFocusedVariants == 2
                      ? Colors.green
                      : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

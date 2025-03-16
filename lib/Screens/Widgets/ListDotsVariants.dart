import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';

class ListDotsVariants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDotsVariantsState();
}

class ListDotsVariantsState extends State<ListDotsVariants> {
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
            width: _provider.indexVariantsFocused == 0 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexVariantsFocused == 0
                      ? Colors.yellow
                      : Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 8,
            width: _provider.indexVariantsFocused == 1 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexVariantsFocused == 1
                      ? Colors.yellow
                      : Colors.grey,
            ),
          ),
          SizedBox(width: 2),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 8,
            width: _provider.indexVariantsFocused == 2 ? 14 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color:
                  _provider.indexVariantsFocused == 2
                      ? Colors.yellow
                      : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

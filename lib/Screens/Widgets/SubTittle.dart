import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SubTittle extends StatelessWidget {
  const SubTittle({super.key});

  @override
  Widget build(BuildContext context) {
    Uri _uri = Uri.parse(Provider.of<ProviderGame>(context).link);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.yellowAccent,
          ),
          padding: EdgeInsets.all(8),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              iconColor: Colors.black,
              overlayColor: Colors.transparent,
            ),

            onPressed: () async {
              if (!await launchUrl(_uri)) {
                print("Ошибка");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.verified_user),
                Text(
                  "Оставь отзыв!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                Icon(Ionicons.git_network_outline),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

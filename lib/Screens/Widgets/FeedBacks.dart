import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    ProviderGame _provider = Provider.of<ProviderGame>(context);
    Uri _uri = Uri.parse(_provider.link);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [Colors.white, Colors.blueAccent]),
      ),
      child: TextButton(
        onPressed: () async {
          if (!await launchUrl(_uri)) {
            print("Ошибка");
          }
        },
        child: Text("Оставить отзыв", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

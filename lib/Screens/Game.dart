import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ListDots.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Tittle.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List levels = List.generate(3, (i) => i);

  @override
  Widget build(BuildContext context) {
    var widght = MediaQuery.of(context).size.width * 0.9;
    ProviderGame _provider = Provider.of<ProviderGame>(context);
    bool isPlaying = _provider.isPlaying;
    return Scaffold(
      appBar: AppBar(
        title: Tittle(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: MediaQuery.of(context).size.width,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: ListTile(
                    title: Text(
                      index == 0
                          ? "Простой"
                          : index == 1
                          ? "Средний"
                          : "Сложный",

                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
              itemCount: levels.length,
            ),
          ),

          SizedBox(height: 10),
          ListDots(),
          SizedBox(height: 10),
          AnimatedContainer(
            duration: Duration(milliseconds: 450),
            width: widght,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: isPlaying ? Colors.redAccent : Colors.green,
            ),

            child: TextButton(
              onPressed: () {
                _provider.toggleIsPlaying();
              },
              child: Text(
                isPlaying ? "Прекратить играть" : "Играть",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

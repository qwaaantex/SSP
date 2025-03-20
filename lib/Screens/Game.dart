import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:stonescrissorpaper/Screens/GameLogic.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Created.dart';
import 'package:stonescrissorpaper/Screens/Widgets/FeedBacks.dart';
import 'package:stonescrissorpaper/Screens/Widgets/SubTittle.dart';
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
        backgroundColor: ThemeData.dark().canvasColor,
      ),
      body: TweenAnimationBuilder(
        tween: Tween(begin: isPlaying ? 0.0 : 1.0, end: isPlaying ? 1.0 : 0.0),
        curve: Curves.bounceIn,
        duration: Duration(milliseconds: 300),
        builder: (BuildContext context, double size, Widget? child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: ThemeData.dark().canvasColor),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Работает без интернета и на всех устройствах!",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        SubTittle(),
                        SizedBox(height: 10),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade600, Colors.grey],
                            ),
                          ),
                          child: GameLogic(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: widght,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isPlaying ? Colors.redAccent : Colors.green,
                    ),
                    child: TextButton(
                      onPressed: () {
                        _provider.toggleIsPlaying();
                        _provider.startGame();
                      },
                      child: Text(
                        isPlaying ? "Прекратить играть" : "Играть",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FeedBack(),
                  SizedBox(height: 10),
                  Created(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

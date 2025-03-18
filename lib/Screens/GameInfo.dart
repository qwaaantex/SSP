import 'package:flutter/material.dart';
import 'package:stonescrissorpaper/Screens/Game.dart';

class GameInfo extends StatefulWidget {
  const GameInfo({super.key});

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 400),
                pageBuilder:
                    (context, animation, secondaryAnimation) => GameScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          },

          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.grey,
        ),
      ),
      body: Text("dhdhj"),
    );
  }
}

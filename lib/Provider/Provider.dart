import 'dart:async';

import 'package:flutter/material.dart';

class ProviderGame extends ChangeNotifier {
  bool isPlaying = false;
  int StartGame = 5;
  bool isChosenStep = false;
  List AnswersVariants = ["Камень", "Ножницы", "Бумага"];
  int indexFocusedVariants = 0;
  int indexVariantsFocused = 0;
  String link = 'https://github.com/qwaaantex/Stone_Scissors_Paper';

  void toggleIsPlaying() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void toggleVariants(int index) {
    indexVariantsFocused = index;
    notifyListeners();
  }

  void toggleLevels(int index) {
    indexFocusedVariants = index;
    notifyListeners();
  }

  void startGame() {
    int countdown = 5;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying) {
        isChosenStep = false;
        notifyListeners();
        if (countdown > 0) {
          StartGame = countdown;
          notifyListeners();
          countdown--;
        } else if (countdown == 0) {
          timer.cancel();
          isChosenStep = !isChosenStep;
          notifyListeners();
        } else {
          timer.cancel();
        }
      } else {
        timer.cancel();
      }
    });
  }
}

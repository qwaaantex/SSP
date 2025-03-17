import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ProviderGame extends ChangeNotifier {
  bool isPlaying = false;
  int StartGame = 5;
  bool isChosenStep = false;
  List AnswersVariants = ["Камень", "Ножницы", "Бумага"];
  int index = 0;
  int GetAnswerTimer = 5;
  bool isRightAnswer = false;
  bool isChosensStep = true;
  bool isStepEnd = true;
  int indexVariantsFocused = 0;
  String link = 'https://github.com/qwaaantex/Stone_Scissors_Paper';

  void toggleIsPlaying() {
    isPlaying = !isPlaying;
    if (!isPlaying) {
      resetGame();
    }
    notifyListeners();
  }

  void resetGame() {
    isStepEnd = true;
    isChosenStep = false;
    isChosensStep = true;
    GetAnswerTimer = 5;
    StartGame = 5;
  }

  void toggleVariants(int index) {
    indexVariantsFocused = index;
    notifyListeners();
  }

  void startGame() {
    int countdown = 5;
    isChosenStep = false;
    notifyListeners();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying) {
        if (countdown > 0) {
          StartGame = countdown;
          notifyListeners();
          countdown--;
        } else {
          timer.cancel();
          isChosenStep = true;
          isStepEnd = true;
          isChosensStep = true;
          notifyListeners();
        }
      } else {
        timer.cancel();
      }
    });
  }

  void getAnswer(int userChoice) {
    index = userChoice;
    isChosensStep = false;
    isStepEnd = false;
    notifyListeners();

    int countdown = 5;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying && !isChosensStep) {
        if (countdown > 0) {
          GetAnswerTimer = countdown;
          notifyListeners();
          countdown--;
        } else {
          timer.cancel();

          int computerChoice = Random().nextInt(AnswersVariants.length);

          if (userChoice == computerChoice) {
            isRightAnswer = true;
          } else if ((userChoice == 0 && computerChoice == 1) ||
              (userChoice == 1 && computerChoice == 2) ||
              (userChoice == 2 && computerChoice == 0)) {
            // Paper beats rock
            isRightAnswer = true;
          } else {
            isRightAnswer = false;
          }

          isChosensStep = true;

          Timer(Duration(seconds: 2), () {
            if (isPlaying) {
              isStepEnd = true;
              notifyListeners();
            }
          });

          notifyListeners();
        }
      } else {
        timer.cancel();
      }
    });
  }
}

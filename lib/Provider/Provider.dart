import 'package:flutter/material.dart';

class ProviderGame extends ChangeNotifier {
  bool isPlaying = false;

  void toggleIsPlaying() {
    isPlaying = !isPlaying;
    notifyListeners();
  }
}

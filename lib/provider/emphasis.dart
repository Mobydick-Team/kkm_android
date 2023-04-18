import 'package:flutter/material.dart';

class Emphaisis extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  bool _ispressed = false;

  bool get ispressed => _ispressed;

  void change() {
    _ispressed = !ispressed;
    notifyListeners();
    print("바뀜");
  }
}

import 'package:flutter/material.dart';

class StackModel extends ChangeNotifier{
  late bool value = false;

  bool valRead(){
    return value;
  }

  void valChange(){
    value = !value;
    notifyListeners();
  }
}

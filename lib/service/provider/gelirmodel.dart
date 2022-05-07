import 'package:flutter/material.dart';

class GelirModel extends ChangeNotifier{
  late int value = 0;

  int valRead(){
    return value;
  }

  void valChange(int val){
    value = val;
    notifyListeners();
  }
}
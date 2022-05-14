import 'package:flutter/material.dart';

class IndexModel extends ChangeNotifier{
  late int value = 0;

  int valRead(){
    return value;
  }

  void valChange(int val){
    value = val;
    notifyListeners();
  }
}
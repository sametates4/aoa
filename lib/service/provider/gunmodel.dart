import 'package:flutter/material.dart';

class GunModel extends ChangeNotifier{
  late int value = DateTime.now().month;

  int valRead(){
    return value;
  }

  void valChange(int val){
    value = val;
    notifyListeners();
  }
}
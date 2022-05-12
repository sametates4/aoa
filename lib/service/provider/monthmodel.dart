import 'package:flutter/material.dart';

class MonthModel extends ChangeNotifier{
  late String value = "";

  String valRead(){
    return value;
  }

  void valChange(String val){
    value = val;
    notifyListeners();
  }
}
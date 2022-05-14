import 'package:flutter/material.dart';

class GunModel extends ChangeNotifier{
  late String value = "${DateTime.now().month}";

  String valRead(){
    return value;
  }

  void valChange(String val){
    value = val;
    notifyListeners();
  }
}
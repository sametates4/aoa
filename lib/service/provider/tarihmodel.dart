import 'package:flutter/material.dart';

class TarihModel extends ChangeNotifier{
  late String value = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  String valRead(){
    return value;
  }

  void valChange(String val){
    value = val;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class TarihBitisModel extends ChangeNotifier{
  late String value = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  String valRead(){
    return value;
  }

  void valChange(String val){
    value = val;
    notifyListeners();
  }
}
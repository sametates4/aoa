import 'package:flutter/material.dart';

class TarihModel extends ChangeNotifier{
  late String value = "Tarih Seçiniz";

  String valRead(){
    return value;
  }

  void valChange(String val){
    value = val;
    notifyListeners();
  }
}
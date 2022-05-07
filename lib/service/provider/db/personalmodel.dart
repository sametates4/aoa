import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:flutter/material.dart';

class PersonalModel extends ChangeNotifier {
  List<Personal> list = <Personal>[];
  final PersonalDao _dao = PersonalDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(String tur, int ucret, String tarih, String yapilanis) async {
    _dao.insert({'tur': tur, 'ucret': ucret, 'tarih': tarih, 'yapilanis':yapilanis});
    list = await _dao.read();
    notifyListeners();
  }

  Future update(String tur, int ucret, String tarih, int id, String yapilanis) async {
    _dao.update(id, {'tur': tur, 'ucret': ucret, 'tarih': tarih, 'yapilanis':yapilanis});
    list = await _dao.read();
    notifyListeners();
  }

  Future delete(int id) async {
    _dao.delete(id);
    list = await _dao.read();
    notifyListeners();
  }
}

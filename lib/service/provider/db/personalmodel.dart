import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:flutter/material.dart';

class PersonalModel extends ChangeNotifier {
  List<Personal> list = <Personal>[];
  List<Personal> searchList = <Personal>[];
  final PersonalDao _dao = PersonalDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future<void> search(String baslangic, String bitis) async{
    searchList = await _dao.search(baslangic, bitis);
    print("aranan kan$searchList");
    notifyListeners();
  }

  Future insert(String tur, int ucret, String tarih, String yapilanis, int search) async {
    _dao.insert({'tur': tur, 'ucret': ucret, 'tarih': tarih, 'yapilanis':yapilanis, 'search':search});
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

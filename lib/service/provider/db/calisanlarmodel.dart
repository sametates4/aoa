import 'package:aoa/service/db/calisanlardao.dart';
import 'package:aoa/service/model/calisanlar.dart';
import 'package:flutter/material.dart';

class CalisanlarModel extends ChangeNotifier{
  List<Calisanlar> list = <Calisanlar>[];

  final CalisanlarDao _dao = CalisanlarDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(String telefon, String isim) async {
    _dao.insert({'isim':isim, 'telefon':telefon});
    list = await _dao.read();
    notifyListeners();
  }

  Future delete(int id) async {
    _dao.delete(id);
    list = await _dao.read();
    notifyListeners();
  }
}
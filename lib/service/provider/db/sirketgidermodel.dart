import 'package:aoa/service/db/sirketgiderdao.dart';
import 'package:aoa/service/model/sirketgider.dart';
import 'package:flutter/material.dart';

class SirketGiderModel extends ChangeNotifier{
  List<SirketGider> list = <SirketGider>[];
  List<SirketGider> searchList = <SirketGider>[];

  final SirketGiderDao _dao = SirketGiderDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(int gider, String aciklama, String month, String tarih) async {
    _dao.insert({
      'gider':gider,
      'aciklama':aciklama,
      'month':month,
      'tarih':tarih
    });
    list = await _dao.read();
    notifyListeners();
  }

  Future<void> searchRead(String val) async{
    searchList = await _dao.search(val);
    notifyListeners();
  }

  Future<void> clear()async{
    searchList.clear();
    notifyListeners();
  }
  Future delete(int id) async {
    _dao.delete(id);
    list = await _dao.read();
    notifyListeners();
  }
}
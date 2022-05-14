import 'package:aoa/service/db/workerdao.dart';
import 'package:aoa/service/model/worker.dart';
import 'package:flutter/material.dart';

class WorkerModel extends ChangeNotifier {
  List<Calisanlar> list = <Calisanlar>[];
  List<Calisanlar> searchList = <Calisanlar>[];
  final WorkerDao _dao = WorkerDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(String isimsoyisim, int ucret, String tarih, int gun,
      String yapilanis, int toplamucret, String telefon, String month) async {
    _dao.insert({
      'isimsoyisim': isimsoyisim,
      'ucret': ucret,
      'tarih': tarih,
      'gun': gun,
      'yapilanis': yapilanis,
      'toplamucret':toplamucret,
      'telefon':telefon,
      'month':month
    });
    list = await _dao.read();
    notifyListeners();
  }

  Future update(int toplamucret, int gun, int id, int ucret) async {
    _dao.update(id, {'toplamucret': toplamucret, 'gun': gun, 'ucret':ucret});
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

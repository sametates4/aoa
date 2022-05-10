import 'package:aoa/service/db/workerdao.dart';
import 'package:aoa/service/model/worker.dart';
import 'package:flutter/material.dart';

class WorkerModel extends ChangeNotifier {
  List<Worker> list = <Worker>[];
  final WorkerDao _dao = WorkerDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(String isimsoyisim, int ucret, String tarih, int gun,
      String yapilanis, int toplamucret, String telefon) async {
    _dao.insert({
      'isimsoyisim': isimsoyisim,
      'ucret': ucret,
      'tarih': tarih,
      'gun': gun,
      'yapilanis': yapilanis,
      'toplamucret':toplamucret,
      'telefon':telefon
    });
  }

  Future update(int toplamucret, int gun, int id) async {
    _dao.update(id, {'toplamucret': toplamucret, 'gun': gun});
    list = await _dao.read();
    notifyListeners();
  }

  Future delete(int id) async {
    _dao.delete(id);
    list = await _dao.read();
    notifyListeners();
  }
}

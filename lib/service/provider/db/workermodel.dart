import 'package:aoa/service/db/workerdao.dart';
import 'package:aoa/service/model/worker.dart';
import 'package:flutter/material.dart';

class WorkerModel extends ChangeNotifier {
  List<Worker> list = <Worker>[];
  List<Worker> searchList = <Worker>[];
  final WorkerDao _dao = WorkerDao();

  Future<void> read() async {
    list = await _dao.read();
    notifyListeners();
  }

  Future insert(String isimsoyisim, int ucret, String tarih, int gun,
      String yapilanis, int toplamucret, String telefon, int month) async {
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

  Future update(int toplamucret, int gun, int id) async {
    _dao.update(id, {'toplamucret': toplamucret, 'gun': gun});
    list = await _dao.read();
    notifyListeners();
  }

  Future<void> search(int month) async{
    for(int i = 0; i < list.length; i++){
      if(list[i].month == month){
        searchList.add(list[i]);
      }
    }
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

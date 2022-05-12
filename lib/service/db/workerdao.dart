import 'package:aoa/service/db/veritabaniYardimcisi.dart';
import 'package:aoa/service/model/worker.dart';

class WorkerDao{
  Future<List<Worker>> read() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM worker");
    return data.map((e) => Worker.fromMap(e)).toList();
  }

  Future<void> insert(Map<String, Object> data) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.insert("worker", data);
  }

  Future<List<Worker>> search(int month) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data = await db.rawQuery('''SELECT * FROM worker WHERE tarih LIKE '$month' ''');
    return data.map((e) => Worker.fromMap(e)).toList();
  }

  Future<void> update(int id, Map<String, Object> data)async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.update("worker", data, where: "id=?", whereArgs: [id]);
  }

  Future<bool> delete(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    int del = await db.delete("worker", where: 'id = ?', whereArgs: [id]);
    return del > 0;
  }
}
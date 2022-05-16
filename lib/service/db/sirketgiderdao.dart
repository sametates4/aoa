import 'package:aoa/service/db/veritabaniYardimcisi.dart';
import 'package:aoa/service/model/sirketgider.dart';

class SirketGiderDao{
  Future<List<SirketGider>> read() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM sirketgider");
    return data.map((e) => SirketGider.fromMap(e)).toList();
  }

  Future<void> insert(Map<String, Object> data) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.insert("sirketgider", data);
  }

  Future<void> update(int id, Map<String, Object> data)async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.update("sirketgider", data, where: "id=?", whereArgs: [id]);
  }

    Future<List<SirketGider>> search(String val) async{
      var db = await VeritabaniYardimcisi.veritabaniErisim();
      List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM sirketgider where month = $val");
      return data.map((e) => SirketGider.fromMap(e)).toList();
    }

  Future<bool> delete(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    int del = await db.delete("sirketgider", where: 'id = ?', whereArgs: [id]);
    return del > 0;
  }
}
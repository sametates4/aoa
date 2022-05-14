import 'package:aoa/service/db/veritabaniYardimcisi.dart';
import 'package:aoa/service/model/personal.dart';

class PersonalDao{
  Future<List<Personal>> read() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM personal");
    return data.map((e) => Personal.fromMap(e)).toList();
  }

  Future<List<Personal>> search(String val) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM personal where month = $val");
    return data.map((e) => Personal.fromMap(e)).toList();
  }

  Future<void> insert(Map<String, Object> data) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.insert("personal", data);
  }

  Future<void> update(int id, Map<String, Object> data)async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.update("personal", data, where: "id=?", whereArgs: [id]);
  }

  Future<bool> delete(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    int del = await db.delete("personal", where: 'id = ?', whereArgs: [id]);
    return del > 0;
  }
}
import 'package:aoa/service/db/veritabaniYardimcisi.dart';
import 'package:aoa/service/model/calisanlar.dart';

class CalisanlarDao{
  Future<List<Calisanlar>> read() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> data =  await db.rawQuery("SELECT * FROM calisanlar");
    return data.map((e) => Calisanlar.fromMap(e)).toList();
  }

  Future<void> insert(Map<String, Object> data) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    db.insert("calisanlar", data);
  }

  Future<bool> delete(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    int del = await db.delete("calisanlar", where: 'id = ?', whereArgs: [id]);
    return del > 0;
  }
}
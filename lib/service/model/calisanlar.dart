class Calisanlar{
  late int id;
  late String isim;
  late String telefon;

  Calisanlar();

  Calisanlar.fromMap(Map<String, dynamic> map){
    id = map['id'];
    isim = map['isim'];
    telefon = map['telefon'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['isim'] = isim;
    map['ucret'] = telefon;
    return map;
  }
}
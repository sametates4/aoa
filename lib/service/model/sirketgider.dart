class SirketGider{
  late int id;
  late int gider;
  late String month;
  late String aciklama;
  late String tarih;

  SirketGider();

  SirketGider.fromMap(Map<String, dynamic> map){
    id = map['id'];
    gider = map['gider'];
    month = map['month'];
    aciklama = map['aciklama'];
    tarih = map['tarih'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['gider'] = gider;
    map['month'] = month;
    map['aciklama'] = aciklama;
    map['tarih'] = tarih;
    return map;
  }
}
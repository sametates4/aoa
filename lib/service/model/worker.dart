class Worker{
  late int id;
  late String isimsoyisim;
  late int ucret;
  late String tarih;
  late int gun;
  late String yapilanis;
  late int toplamucret;
  late String telefon;
  late int month;

  Worker();

  Worker.fromMap(Map<String, dynamic> map){
    id = map['id'];
    isimsoyisim = map['isimsoyisim'];
    ucret = map['ucret'];
    gun = map['gun'];
    tarih = map['tarih'];
    yapilanis = map['yapilanis'];
    toplamucret = map['toplamucret'];
    telefon = map['telefon'];
    month = map['month'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['isimsoyisim'] = isimsoyisim;
    map['ucret'] = ucret;
    map['gun'] = gun;
    map['tarih'] = tarih;
    map['yapilanis'] = yapilanis;
    map['toplamucret'] = toplamucret;
    map['telefon'] = telefon;
    map['month'] = month;
    return map;
  }
}
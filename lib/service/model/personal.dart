class Personal{
  late int id;
  late String tur;
  late int ucret;
  late String tarih;
  late String yapilanis;
  late String month;
  late int saat;

  Personal();

  Personal.fromMap(Map<String, dynamic> map){
    id = map['id'];
    tur = map['tur'];
    ucret = map['ucret'];
    tarih = map['tarih'];
    yapilanis = map['yapilanis'];
    month = map['month'];
    saat = map['saat'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['tur'] = tur;
    map['ucret'] = ucret;
    map['tarih'] = tarih;
    map['yapilanis'] = yapilanis;
    map['month'] = month;
    map['saat'] = saat;
    return map;
  }
}
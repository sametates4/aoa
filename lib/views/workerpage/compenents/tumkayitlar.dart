import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TumKayitlar extends StatelessWidget {
  const TumKayitlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tüm Kayıtlar"),),
      body: Consumer<WorkerModel>(
        builder: (context, value, child) {
          if(value.list.isNotEmpty){
            return ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index){
                var reserve = value.list.length - 1 - index;
                var i = value.list[reserve];
                return Card(
                  child: ListTile(
                    leading: Text("Çalışılan Gün: ${i.gun}"),
                    title: Text(i.isimsoyisim),
                    subtitle: Text(i.yapilanis),
                    trailing: Column(
                      children: [
                        Text("İşe Başlama Tarihi: ${i.tarih}"),
                        //Text("Çalışılan Gün: ${i.gun}"),
                        Text("Anlaşılan üçret: ${i.ucret}"),
                        Text("Verilecek toplam üçret: ${i.toplamucret}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center(child: Text("Yapılmış kayıt yok"),);
          }
        }),
    );
  }
}

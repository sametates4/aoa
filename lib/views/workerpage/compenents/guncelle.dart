import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
import 'package:aoa/views/workerpage/compenents/guncellebottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Guncelle extends StatelessWidget {
  const Guncelle({Key? key}) : super(key: key);


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
                      title: Text(i.isimsoyisim),
                      subtitle: Text(i.yapilanis),
                      leading: Text(i.telefon),
                      onTap: (){
                        context.read<GunModel>().valChange(i.gun);
                        Get.bottomSheet(GuncelleCard(i));
                      },
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

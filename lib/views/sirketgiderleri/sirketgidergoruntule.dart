import 'package:aoa/service/provider/db/sirketgidermodel.dart';
import 'package:aoa/views/sirketgiderleri/sirketgiderdetay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SirketGiderDoruntule extends StatelessWidget {
  const SirketGiderDoruntule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şirket Giderleri"),),
      body: Consumer<SirketGiderModel>(
        builder: (context, value, child){
          if(value.list.isNotEmpty){
            return ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index){
                var i = value.list[index];
                return Card(
                  child: ListTile(
                    title: Text("${i.aciklama.substring(0, 20)} ..."),
                    subtitle: Text("${i.gider} tl"),
                    trailing: Text(i.tarih),
                    onTap: (){
                      Get.bottomSheet(SirketGiderDetay(gider: i));
                    },
                  ),
                );
              },
            );
          }else{
            return Center(child: Text("Kayıt Edilmiş Gider bulunmamaktadır"),);
          }
        },
      ),
    );
  }
}

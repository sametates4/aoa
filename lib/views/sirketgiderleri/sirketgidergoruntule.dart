import 'package:aoa/service/provider/db/sirketgidermodel.dart';
import 'package:aoa/views/sirketgiderleri/sirketgiderdetay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SirketGiderGoruntule extends StatefulWidget {
  const SirketGiderGoruntule({Key? key}) : super(key: key);

  @override
  State<SirketGiderGoruntule> createState() => _SirketGiderGoruntuleState();
}

class _SirketGiderGoruntuleState extends State<SirketGiderGoruntule> {

  @override
  void initState() {
    Provider.of<SirketGiderModel>(context, listen: false).read();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şirket Giderleri"),),
      body: Container(
        child: Consumer<SirketGiderModel>(
          builder: (context, value, child){
            if(value.list.isNotEmpty){
              return ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index){
                  var i = value.list[index];
                  return Card(
                    child: ListTile(
                      title: Text(i.aciklama),
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
      ),
    );
  }
}


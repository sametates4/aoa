import 'package:aoa/views/previewpageworker/previewpageworker.dart';
import 'package:aoa/views/workerpage/compenents/calisankayit.dart';
import 'package:aoa/views/workerpage/compenents/calisanlarim.dart';
import 'package:aoa/views/workerpage/compenents/custombutton.dart';
import 'package:aoa/views/workerpage/compenents/dialog.dart';
import 'package:aoa/views/workerpage/compenents/guncelle.dart';
import 'package:aoa/views/workerpage/compenents/kayit.dart';
import 'package:aoa/views/workerpage/compenents/tumkayitlar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                Get.to(() => const Kayit());
              },
                child: CustomButton("Kayıt Ekle", "assets/kayit.png")),
            InkWell(
              onTap: (){
                Get.to(() => const Guncelle());
              },
                child: CustomButton("Kayıt Güncelle", "assets/güncelle.png")),
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                Get.to(() => const Calisanlarim());
              },
                child: CustomButton("Çalışanlarım", "assets/calisanlarim.png")),
            InkWell(
              onTap: (){
                Get.bottomSheet(Register());
              },
                child: CustomButton("Çalışan Ekle", "assets/calisanekle.png")),
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                Get.to(() => const TumKayitlar());
              },
                child: CustomButton("Tüm Kayıtlar", "assets/tumkayitlar.png")),
            InkWell(
              onTap: (){
                //Get.to(() => const PreviewPageWorker());
                Get.bottomSheet(DialogRaporWorker());
              },
                child: CustomButton("Rapor Oluştur", "assets/rapor.png")),
          ],
        ),
        const SizedBox(height: 22,),
      ],
    );
  }
}

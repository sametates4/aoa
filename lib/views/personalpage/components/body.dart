import 'package:aoa/service/provider/indexmodel.dart';
import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:aoa/views/personalpage/components/customubutton.dart';
import 'package:aoa/views/personalpage/components/dialog.dart';
import 'package:aoa/views/personalpage/components/gelir.dart';
import 'package:aoa/views/personalpage/components/gider.dart';
import 'package:aoa/views/personalpage/components/mesai.dart';
import 'package:aoa/views/personalpage/components/son10.dart';
import 'package:aoa/views/personalpage/components/tumkayit.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  context.read<TarihModel>().valChange("Tarih Seçiniz");
                  Get.to(() => Gelir());
                },
                child: CustomButton("Gelir Ekle", "assets/add.png")),
            InkWell(
              onTap: () {
                context.read<TarihModel>().valChange("Tarih Seçiniz");
                Get.to(() => Gider());
              },
              child: CustomButton("Gider Ekle", "assets/gider.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  context.read<TarihModel>().valChange("Tarih Seçiniz");
                  Get.to(() => Mesai());
                },
                child: CustomButton("Mesai Ekle", "assets/mesai.png")),
            InkWell(
              onTap: () {
                Get.to(() => const TumKayit());
              },
              child: CustomButton("Tüm Kayıtlar", "assets/doc.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.bottomSheet(DialogRapor());
                context.read<IndexModel>().valChange(0);
              },
              child: Container(
                width: 150,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.purple,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(-4, -4),
                      ),
                    ]),
                child: const Center(
                  child: Text(
                    "Rapor Oluştur",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
         //Son10(),
      ],
    );
  }
}

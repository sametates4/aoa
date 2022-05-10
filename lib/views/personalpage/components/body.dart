import 'package:aoa/views/personalpage/components/customubutton.dart';
import 'package:aoa/views/personalpage/components/dialog.dart';
import 'package:aoa/views/personalpage/components/gelir.dart';
import 'package:aoa/views/personalpage/components/gider.dart';
import 'package:aoa/views/personalpage/components/mesai.dart';
import 'package:aoa/views/personalpage/components/son10.dart';
import 'package:aoa/views/personalpage/components/tumkayit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                Get.to(() => Gelir());
              },
                child: CustomButton("Gelir Ekle", "assets/add.png")
            ),
            InkWell(
                onTap: (){
                  Get.to(() => Gider());
                },
                child: CustomButton("Gider Ekle", "assets/gider.png"),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){
                  Get.to(() => Mesai());
                },
                child: CustomButton("Mesai Ekle", "assets/mesai.png")
            ),
            InkWell(
              onTap: (){
                Get.bottomSheet(const DialogRapor());
              },
              child: CustomButton("Rapor Oluştur", "assets/doc.png"),
            ),
          ],
        ),
        const SizedBox(height: 40,),
        const Son10(),
      ],
    );
  }
}

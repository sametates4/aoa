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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  const Text("Gelir Ekle", style: TextStyle(fontSize: 20),),
                  const Spacer(),
                  Image.asset("assets/add.png", height: 50,),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  const Text("Gider Ekle", style: TextStyle(fontSize: 20),),
                  const Spacer(),
                  Image.asset("assets/remove.png"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  const Text("Mesai Ekle", style: TextStyle(fontSize: 20),),
                  const Spacer(),
                  Image.asset("assets/add.png"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  const Text("Kayıtları Görüntüle", style: TextStyle(fontSize: 20),),
                  const Spacer(),
                  Image.asset("assets/add.png"),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.bottomSheet(const DialogRapor());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    const Text("Rapor oluştur", style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    Image.asset("assets/doc.png", height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Son10(),
      ],
    );
  }
}

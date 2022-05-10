import 'package:aoa/views/workerpage/compenents/calisankayit.dart';
import 'package:aoa/views/workerpage/compenents/calisanlarim.dart';
import 'package:aoa/views/workerpage/compenents/kayit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Kayıt Ekle"),
              onPressed: (){
                Get.to(Kayit());
              },
            ),
            ElevatedButton(
              child: const Text("Kayıt Güncelle"),
              onPressed: (){},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Kayıt Görüntüle"),
              onPressed: (){},
            ),
            ElevatedButton(
              child: const Text("Çalışanlarım"),
              onPressed: (){
                Get.to(Calisanlarim());
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.save_outlined),
              label: const Text("Rapor Oluştur"),
              onPressed: (){},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.save_outlined),
              label: const Text("Çalışan Ekle"),
              onPressed: (){
                Get.bottomSheet(Register());
              },
            ),
          ],
        ),
      ],
    );
  }
}

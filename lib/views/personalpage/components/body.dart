import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:aoa/service/pdf/personal/createpdf.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/views/personalpage/components/gelir.dart';
import 'package:aoa/views/personalpage/components/gider.dart';
import 'package:aoa/views/personalpage/components/mesai.dart';
import 'package:aoa/views/personalpage/components/son10.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              child: const Text("Gelir Ekle"),
              onPressed: (){
                Get.to(() => Gelir());
              },
            ),
            ElevatedButton(
              child: const Text("Gider Ekle"),
              onPressed: (){
                Get.to(() => Gider());
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Mesai ekle"),
              onPressed: (){
                Get.to(() => Mesai());
              },
            ),
            ElevatedButton(
              child: const Text("Kayıt Görüntüle"),
              onPressed: (){},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.save_outlined),
              label: const Text("Rapor Oluştur"),
              onPressed: ()async{
                var result = await PersonalDao().read();
                List<Personal> model = result;
                createPDF(model);
              },
            ),
          ],
        ),
        const Son10(),
      ],
    );
  }
}

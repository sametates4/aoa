import 'package:aoa/service/provider/indexmodel.dart';
import 'package:aoa/views/personalpage/components/dialog.dart';
import 'package:aoa/views/previewpage/previewpage.dart';
import 'package:aoa/views/workerpage/compenents/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Kendim İçin oluştur"),
                const Spacer(),
                ElevatedButton(
                  child: const Text("Seç"),
                  onPressed: (){
                    Get.back();
                    context.read<IndexModel>().valChange(0);
                    Get.bottomSheet(DialogRapor());
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text("Çalışanım İçin oluştur"),
                const Spacer(),
                ElevatedButton(
                  child: const Text("Seç"),
                  onPressed: (){
                    Get.back();
                    context.read<IndexModel>().valChange(0);
                    Get.bottomSheet(DialogRaporWorker());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

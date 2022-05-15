import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:aoa/views/bottomvawbar.dart';
import 'package:aoa/views/sirketgiderleri/sirketgidergoruntule.dart';
import 'package:aoa/views/sirketgiderleri/sirketgiderkayit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SirketGiderPage extends StatefulWidget {
  const SirketGiderPage({Key? key}) : super(key: key);

  @override
  State<SirketGiderPage> createState() => _SirketGiderPageState();
}

class _SirketGiderPageState extends State<SirketGiderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şirket Giderleri"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    context.read<TarihModel>().valChange("Tarih Seçiniz");
                    Get.to(() => SirketGiderKayit());
                  },
                  child: Container(
                    width: 130,
                    height: 130,
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
                            color: Colors.teal,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: const Center(child: Text("Gider Kayıt Et")),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SirketGiderGoruntule());
                  },
                  child: Container(
                    width: 130,
                    height: 130,
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
                            color: Colors.teal,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: const Center(child: Text("Kayıtları Görüntüle")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

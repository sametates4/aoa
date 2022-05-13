import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:aoa/service/provider/chartgelir.dart';
import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/chartmesai.dart';
import 'package:aoa/service/provider/chartsaat.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/views/homepage/bottom.dart';
import 'package:aoa/views/ozetgrafik/ozetgrafik.dart';
import 'package:aoa/views/personalpage/personalpage.dart';
import 'package:aoa/views/workerpage/workerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PersonalModel>(context, listen: false).read();
    super.initState();
    getData();
  }

  void getData() async {
    int month = int.parse("${DateTime.now().month}${DateTime.now().year}");
    var result = await PersonalDao().read();
    List<Personal> model = result;

    for (int i = 0; i < model.length; i++) {
      if (month == model[i].month) {
        if (model[i].tur == "0") {
          context.read<ChartGiderModel>().valChange(
              context.read<ChartGiderModel>().valRead() + model[i].ucret);
        }
        if (model[i].tur == "1") {
          context.read<ChartGelirModel>().valChange(
              context.read<ChartGelirModel>().valRead() + model[i].ucret);
        }
        if (model[i].tur == "2") {
          context.read<ChartMesaiModel>().valChange(
              context.read<ChartMesaiModel>().valRead() + model[i].ucret);
          context.read<ChartSaatModel>().valChange(
              context.read<ChartSaatModel>().valRead() + model[i].saat);
        }
      }
    }
  }

  late String appPackageName = "sametates.com.aoa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(() => const WorkerPage());
                  },
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.teal,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(2, 3),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/worker.png", height: 70,),
                            const SizedBox(height: 8,),
                            const Text("Çalışanım için hesapla", style: TextStyle(fontSize: 12),),
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(() =>  const PersonaPage());
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
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/personal.png", height: 70,),
                            const SizedBox(height: 8,),
                            const Text("Kendim için hesapla"),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(() => const OzetGrafik());
                  },
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.teal,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(2, 3),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: const Center(
                        child: Text("Özet Grafik")),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //Get.to(() =>  const PersonaPage());
                    Get.bottomSheet(const Bottom());
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
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: const Center(
                        child: Text("Hızlı Rapor Oluştur")),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    try {
                      launch("market://details?id=" + appPackageName);
                    } on PlatformException catch(e) {
                      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
                    } finally {
                      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
                    }
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
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: const Center(
                        child: Text("Bizi Oylayın")),
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:aoa/service/searchworker.dart';
import 'package:aoa/views/previewpageworker/previewpageworker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DialogRaporWorker extends StatelessWidget {
  DialogRaporWorker({Key? key}) : super(key: key);

  final month = [
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 415,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              SizedBox(
                height: 324,
                child: CupertinoPicker(
                  itemExtent: 64,
                  children: month.map((e) => Center(child: Text(e),)).toList(),
                  onSelectedItemChanged: (index){
                    final item = month[index];
                    context.read<MonthModel>().valChange(item);
                    print(item);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        context.read<WorkerModel>().clear();
                        SearchWorker(month: context.read<MonthModel>().valRead(), context: context).search();
                        Get.back();
                        Get.to(const PreviewPageWorker());
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.teal,
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
                        child: const Center(child: Text("Onayla", style: TextStyle(fontSize: 19),),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
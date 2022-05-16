import 'package:aoa/service/provider/db/sirketgidermodel.dart';
import 'package:aoa/service/provider/indexmodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:aoa/views/previewpagesirket/previewpagesirket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MonthDialog extends StatelessWidget {
  MonthDialog({Key? key}) : super(key: key);

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
      height: 416,
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
                  children: month
                      .map((e) => Center(
                    child: Text(e),
                  ))
                      .toList(),
                  onSelectedItemChanged: (index) {
                    final item = month[index];
                    context.read<MonthModel>().valChange(item);
                    context.read<IndexModel>().valChange(index);
                    print(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        switch (context.read<IndexModel>().valRead()) {
                          case 0:
                            print("ocak");
                            context.read<SirketGiderModel>().searchRead("1");
                            break;
                          case 1:
                            context.read<SirketGiderModel>().searchRead("2");
                            print("Şubat");
                            break;
                          case 2:
                            context.read<SirketGiderModel>().searchRead("3");
                            print("Mart");
                            break;
                          case 3:
                            context.read<SirketGiderModel>().searchRead("4");
                            print("Nisan");
                            break;
                          case 4:
                            context.read<SirketGiderModel>().searchRead("5");
                            print("Mayıs");
                            break;
                          case 5:
                            context.read<SirketGiderModel>().searchRead("6");
                            print("Hazşran");
                            break;
                          case 6:
                            context.read<SirketGiderModel>().searchRead("7");
                            print("Temmuz");
                            break;
                          case 7:
                            context.read<SirketGiderModel>().searchRead("8");
                            print("Ağustos");
                            break;
                          case 8:
                            context.read<SirketGiderModel>().searchRead("9");
                            print("Eyülü");
                            break;
                          case 9:
                            context.read<SirketGiderModel>().searchRead("10");
                            print("Ekim");
                            break;
                          case 10:
                            context.read<SirketGiderModel>().searchRead("11");
                            print("Kasım");
                            break;
                          case 11:
                            context.read<SirketGiderModel>().searchRead("12");
                            print("<Aralık>");
                            break;
                        }
                        context.read<SirketGiderModel>().clear();
                        Get.back();
                        Get.to(() => PreviewPageSirket());
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
                            "Onayla",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
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

import 'package:aoa/service/model/sirketgider.dart';
import 'package:aoa/service/provider/db/sirketgidermodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:flutter/material.dart';
import 'package:aoa/service/pdf/sirket/createpdf.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PreviewPageSirket extends StatefulWidget {
  const PreviewPageSirket({Key? key}) : super(key: key);

  @override
  State<PreviewPageSirket> createState() => _PreviewPageSirketState();
}

class _PreviewPageSirketState extends State<PreviewPageSirket> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Ön İzleme"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const Text("Yevmiye - Puantaj Hesabım"),
                      const Text(""),
                      Text(
                          "Tarih: ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Consumer<SirketGiderModel>(builder: (context, value, child) {
                  if (value.searchList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: value.searchList.length,
                      itemBuilder: (context, index) {
                        var i = value.searchList[index];
                        return Card(
                          child: ListTile(
                            title: Text(i.aciklama),
                            subtitle: Text("${i.gider} tl"),
                            trailing: Text(i.tarih),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Yapılmış kayıt yok"),
                    );
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await context.read<SirketGiderModel>().searchList;
                          List<SirketGider> model = result;
                          createPDF(model, context.read<MonthModel>().valRead());
                          Get.back();
                        },
                        child: Container(
                          width: 180,
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
                              "Pdf olarak dışa aktar",
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ),
                    ],
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

import 'package:aoa/service/model/personal.dart';
import 'package:aoa/service/pdf/personal/createpdf.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:aoa/service/provider/pdfpersonalgelir.dart';
import 'package:aoa/service/provider/pdfpersonalgider.dart';
import 'package:aoa/service/provider/pdfpersonalsaat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    Provider.of<PersonalModel>(context, listen: false).read();
    super.initState();
    getData();
  }

  void getData() async {
    var result = await context.read<PersonalModel>().searchList;
    List<Personal> model = result;
    print("1212");
    for (int i = 0; i < model.length; i++) {
      if (model[i].tur == "0") {
        context.read<PdfPersonalGider>().valChange(
            context.read<PdfPersonalGider>().valRead() + model[i].ucret);
      }
      if (model[i].tur == "1") {
        context.read<PdfPersonalGelir>().valChange(
            context.read<PdfPersonalGelir>().valRead() + model[i].ucret);
      }
      if (model[i].tur == "2") {
        context.read<PdfPersonalGelir>().valChange(
            context.read<PdfPersonalGelir>().valRead() + model[i].ucret);
        context.read<PdfPersonalSaat>().valChange(
            context.read<PdfPersonalSaat>().valRead() + model[i].saat);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ön İzleme"),
      ),
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
                    Consumer<PersonalModel>(builder: (context, value, child) {
                  if (value.searchList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: value.searchList.length,
                      itemBuilder: (context, index) {
                        var i = value.searchList[index];
                        return Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (i.tur == "1") const Text("Gelir"),
                                if (i.tur == "0") const Text("Gider"),
                                if (i.tur == "2") const Text("Mesai"),
                              ],
                            ),
                            title: Text(i.yapilanis),
                            subtitle: Text("${i.ucret} tl"),
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
                          var result =
                              await context.read<PersonalModel>().searchList;
                          List<Personal> model = result;
                          createPDF(
                              model,
                              context.read<PdfPersonalGelir>().valRead(),
                              context.read<PdfPersonalGider>().valRead(),
                              context.read<MonthModel>().valRead(),
                              context.read<PdfPersonalSaat>().valRead());
                          context.read<PdfPersonalSaat>().valChange(0);
                          context.read<PdfPersonalGelir>().valChange(0);
                          context.read<PdfPersonalGider>().valChange(0);
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

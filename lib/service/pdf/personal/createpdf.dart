import 'package:aoa/service/getx/gelir.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'dart:io';

createPDF(List<Personal> model, int gelir, int gider) async {
  final font = await rootBundle.load("assets/open-sans.ttf");
  final ttf = Font.ttf(font);
  final pdf = Document();
  pdf.addPage(MultiPage(
    pageFormat: PdfPageFormat.a4,
    build: (context) => [
      header(ttf),
      SizedBox(height: 2 * PdfPageFormat.cm),
      title(),
      list(model, context, ttf),
      SizedBox(height: 15),
      total(ttf, gelir, gider),
      //Divider(),
      //buildTotal(invoice),
    ],
    //footer: (context) => buildFooter(invoice),
  ));
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/test.pdf';
  final File file = File(path);
  await file.writeAsBytes((await pdf.save()));
  await OpenFile.open(file.path);
}

Widget header(font) {

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(height: 1 * PdfPageFormat.cm),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Uygulama Adı", style: TextStyle(fontWeight: FontWeight.bold, font: font)),
            Text(""),
            Text("Tarih", style: TextStyle(font: font)),
          ],
        )
      ],
    ),
  ]);
}

Widget title() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Rapor',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
      Text(
          "1/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
    ],
  );
}

Widget list(List<Personal> model, context, font) {
  pdfController controller = Get.put(pdfController());
  return Column(children: [
    Container(
        width: double.infinity,
        height: 15,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Row(
            children: [
              Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(children: [Text("  Harcama Türü", style: TextStyle(font: font)),]),
              ),
              Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(children: [Text("  Para Miktarı", style: TextStyle(font: font)),]),
              ),
              Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(children: [Text("  Yapılan iş", style: TextStyle(font: font)),]),
              ),
              Container(
                width: 121.7,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(children: [Text("  Tarih", style: TextStyle(font: font)),]),
              ),
            ]
        )
    ),
    SizedBox(height: 15),
    ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          if (model[index].tur == "0") {
            controller.valChange(controller.valRead() + model[index].ucret);
            return Container(
              width: double.infinity,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(children: [Text("  Gider", style: TextStyle(font: font)),]),
                    ),
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(children: [Text("  ${model[index].ucret} TL", style: TextStyle(font: font)),]),
                    ),
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(children: [Text("  ${model[index].yapilanis}", style: TextStyle(font: font)),]),
                    ),
                    Container(
                      width: 121.7,
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(children: [Text("  ${model[index].tarih}", style: TextStyle(font: font)),]),
                    ),
                  ]
              )
            );
          } else {
            if (model[index].tur == "1") {
              controller.gelAdd(controller.gelRead() + model[index].ucret);
              return Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Row(children: [Text("  Gelir", style: TextStyle(font: font)),]),
                        ),
                        Container(
                          width: 120,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Row(children: [Text("  ${model[index].ucret} TL", style: TextStyle(font: font)),]),
                        ),
                        Container(
                          width: 120,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Row(children: [Text("  ${model[index].yapilanis}", style: TextStyle(font: font)),]),
                        ),
                        Container(
                          width: 121.7,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Row(children: [Text("  ${model[index].tarih}", style: TextStyle(font: font)),]),
                        ),
                      ]
                  )
              );
            } else {
              if (model[index].tur == "2") {
                controller.gelAdd(controller.gelRead() + model[index].ucret);
                return Container(
                    width: double.infinity,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(children: [Text("  Mesai", style: TextStyle(font: font)),]),
                          ),
                          Container(
                            width: 120,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(children: [Text("  ${model[index].ucret} TL", style: TextStyle(font: font)),]),
                          ),
                          Container(
                            width: 120,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(children: [Text("  ${model[index].yapilanis}", style: TextStyle(font: font)),]),
                          ),
                          Container(
                            width: 121.7,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(children: [Text("  ${model[index].tarih}", style: TextStyle(font: font)),]),
                          ),
                        ]
                    )
                );
              } else {
                return Container();
              }
            }
          }
        }),
  ]);
}

Widget total(font, gelir, gider){
  pdfController controller = Get.put(pdfController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        children: [
          Text("Toplam kazanılan: $gelir", style: TextStyle(font: font)),
          Text("Toplam Harcanan: $gider", style: TextStyle(font: font)),
          Divider(),
          Text("Sonuc: ${gelir - gider}", style: TextStyle(font: font)),
        ]
      )
    ]
  );
}
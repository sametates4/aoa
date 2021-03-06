import 'package:aoa/service/model/sirketgider.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

createPDF(List<SirketGider> model, String ay) async {
  final font = await rootBundle.load("assets/open-sans.ttf");
  final ttf = Font.ttf(font);
  final pdf = Document();
  pdf.addPage(MultiPage(
    maxPages: 50,
    pageFormat: PdfPageFormat.a4,
    build: (context) => [
      header(ttf),
      SizedBox(height: 1 * PdfPageFormat.cm),
      title(ay, ttf),
      listTitle(ttf),
      SizedBox(height: 8),
      newList(model, context, ttf),
      SizedBox(height: 15),
      //total(ttf, gelir, gider, saat),
    ],
    footer: (pw.Context context) {
      return pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(color: PdfColors.grey)));
    },
  ));
  final String dir = (await getApplicationDocumentsDirectory()).path;


  Directory copyto = Directory("storage/emulated/0/Documents");
  if ((await copyto.exists())) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  } else {
    if (await Permission.storage.request().isGranted) {
      await copyto.create();
    } else {
    }
  }
  late String newPath = "${copyto.path}/Sirket Gider Rapor ${DateTime.now().second}.pdf";
  final String path = '$dir/test.pdf';
  final File file = File(newPath);

  await file.writeAsBytes((await pdf.save()));
  await OpenFile.open(file.path);




}

Widget header(font) {

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(height: 0.5 * PdfPageFormat.cm),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yevmiye - Puantaj Hesab??m", style: TextStyle(fontWeight: FontWeight.bold, font: font)),
            Text(""),
            Text("Tarih: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}", style: TextStyle(font: font)),
          ],
        )
      ],
    ),
  ]);
}

Widget title(ay, font) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$ay ay?? Raporu',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, font: font),
      ),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
    ],
  );
}

Widget listTitle(font){
  return Container(
    width: double.infinity,
    height: 25,
    decoration: pw.BoxDecoration(
      border: pw.Border.all(),
      borderRadius: pw.BorderRadius.circular(1),
    ),
    child: Row(
        children: [
          Container(
            width: 347,
            height: 25,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(),
              borderRadius: pw.BorderRadius.circular(1),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("A????klama",style: pw.TextStyle(font: font)),
              ],
            ),
          ),
          Container(
            width: 65,
            height: 25,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(),
              borderRadius: pw.BorderRadius.circular(1),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gider",style: pw.TextStyle(font: font)),
              ],
            ),
          ),
          Container(
            width: 69.7,
            height: 25,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(),
              borderRadius: pw.BorderRadius.circular(1),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tarih",style: pw.TextStyle(font: font)),
              ],
            ),
          ),
        ]
    ),
  );
}

Widget newList(List<SirketGider> model, context, font){
  return       Wrap(
    children: List<Widget>.generate(model.length, (int index) {
      final issue = model[index];
      return Container(
        width: double.infinity,
        height: 30,
        decoration: pw.BoxDecoration(
          border: pw.Border.all(),
          borderRadius: pw.BorderRadius.circular(1),
        ),
        child: Row(
            children: [
              Container(
                width: 347,
                height: 30,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: pw.BorderRadius.circular(1),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(issue.aciklama,style: pw.TextStyle(font: font)),
                  ],
                ),
              ),
              Container(
                width: 65,
                height: 30,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: pw.BorderRadius.circular(1),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(issue.gider.toString(),style: pw.TextStyle(font: font)),
                  ],
                ),
              ),
              Container(
                width: 69.7,
                height: 30,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: pw.BorderRadius.circular(1),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(issue.tarih,style: pw.TextStyle(font: font)),
                  ],
                ),
              ),
            ]
        ),
      );
    }),
  );
}

Widget total(font, gelir, gider, saat){
  return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
            children: [
              Text("Toplam kazan??lan: $gelir", style: TextStyle(font: font)),
              Text("Toplam Harcanan: $gider", style: TextStyle(font: font)),
              Text("Toplam Mesai Saati: $saat", style: TextStyle(font: font)),
              Divider(),
              Text("Sonuc: ${gelir - gider}", style: TextStyle(font: font)),
            ]
        )
      ]
  );
}
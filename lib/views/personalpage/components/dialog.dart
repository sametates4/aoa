import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/tarihbaslangicmodel.dart';
import 'package:aoa/service/provider/tarihbitismodel.dart';
import 'package:aoa/views/previewpage/previewpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DialogRapor extends StatelessWidget {
  const DialogRapor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Başlangıç Tarihi: ${context.watch<TarihBaslangicModel>().valRead()}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050))
                        .then((e) {
                      final DateFormat formatter = DateFormat('dd/MM/yyyy');
                      final String formatted = formatter.format(e!);
                      context.read<TarihBaslangicModel>().valChange(formatted);
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Bitiş Tarihi: ${context.watch<TarihBitisModel>().valRead()}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050))
                        .then((e) {
                      final DateFormat formatter = DateFormat('dd/MM/yyyy');
                      final String formatted = formatter.format(e!);
                      print(formatted);
                      context.read<TarihBitisModel>().valChange(formatted);
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text("Onayla"),
                  onPressed: () {
                    context.read<PersonalModel>().search(context.read<TarihBaslangicModel>().valRead(), context.read<TarihBitisModel>().valRead());
                    Get.to(const PreviewPage());
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

import 'package:aoa/service/provider/db/sirketgidermodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../service/provider/tarihmodel.dart';

class SirketGiderKayit extends StatelessWidget {
  SirketGiderKayit({Key? key}) : super(key: key);

  final _aciklama = TextEditingController();
  final _gider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gider Kayıt Et"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _gider,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Gider'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _aciklama,
              textInputAction: TextInputAction.done,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Açıklama'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    context.watch<TarihModel>().valRead(),
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
                      context.read<GunModel>().valChange("${e!.month}");
                      final DateFormat formatter = DateFormat('dd/MM/yyyy');
                      final String formatted = formatter.format(e);
                      context.read<TarihModel>().valChange(formatted);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          context.read<SirketGiderModel>().insert(
              int.parse(_gider.text),
              _aciklama.text,
              context.read<GunModel>().valRead(),
              context.read<TarihModel>().valRead());
          Get.back();
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
              "Gider Ekle",
              style: TextStyle(fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
}

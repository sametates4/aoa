import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:aoa/service/value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Gider extends StatelessWidget {
  Gider({Key? key}) : super(key: key);
  final _yapilanis = TextEditingController();
  final _ucret = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gider Kayıt"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _yapilanis,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Yapılan harcama"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _ucret,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Harcanan miktar"),
              ),
            ),
            const SizedBox(height: 10,),
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
                      final DateFormat formatter = DateFormat('dd/MM/yyyy');
                      final String formatted = formatter.format(e!);
                      context.read<TarihModel>().valChange(formatted);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text("Kayıt et"),
                  onPressed: (){
                    context.read<PersonalModel>().insert("0", int.parse(_ucret.text), context.read<TarihModel>().valRead(), _yapilanis.text, date);
                    Get.back();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

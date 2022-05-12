import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
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
  late int bos = 0;

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
                      int month = int.parse("${e!.month}${e.year}");
                      context.read<GunModel>().valChange(month);
                      final DateFormat formatter = DateFormat('dd/MM/yyyy');
                      final String formatted = formatter.format(e);
                      context.read<TarihModel>().valChange(formatted);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      context.read<PersonalModel>().insert(
                          "0",
                          int.parse(_ucret.text),
                          context.read<TarihModel>().valRead(),
                          _yapilanis.text,
                          context.read<GunModel>().valRead(), bos);
                      context.read<ChartGiderModel>().valChange(context.read<ChartGiderModel>().valRead() + int.parse(_ucret.text));
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
                      child: const Center(child: Text("Kayıt Et", style: TextStyle(fontSize: 19),),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

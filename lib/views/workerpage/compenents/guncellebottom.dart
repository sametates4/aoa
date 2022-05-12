import 'package:aoa/service/model/worker.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GuncelleCard extends StatelessWidget {
  final Worker worker;

  GuncelleCard(this.worker, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 33, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Çalışan İsmi: ${worker.isimsoyisim}", style: const TextStyle(fontSize: 19),),
            const SizedBox(height: 4,),
            Text("Telefon Numarası: ${worker.telefon}", style: const TextStyle(fontSize: 19),),
            const SizedBox(height: 4,),
            Text("Yapılan İş: ${worker.yapilanis}", style: const TextStyle(fontSize: 19),),
            const SizedBox(height: 4,),
            Text("Anlaşılan üçret: ${worker.ucret}", style: const TextStyle(fontSize: 19),),
            const SizedBox(height: 8,),
            Text("Verilecek toplam üçret: ${worker.toplamucret}", style: const TextStyle(fontSize: 19),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Çalışılan Gün: ", style: TextStyle(fontSize: 19),),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: (){
                    context.read<GunModel>().valChange(context.read<GunModel>().valRead() + 1);
                  },
                ),
                Text(context.watch<GunModel>().valRead().toString(), style: const TextStyle(fontSize: 19),),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: (){
                    context.read<GunModel>().valChange(context.read<GunModel>().valRead() - 1);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    int toplam = worker.ucret * context.read<GunModel>().valRead();
                    context.read<WorkerModel>().update(toplam, context.read<GunModel>().valRead(), worker.id);
                    Navigator.pop(context);
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
                    child: const Center(child: Text("Güncelle", style: TextStyle(fontSize: 19),),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

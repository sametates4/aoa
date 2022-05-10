import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:aoa/service/pdf/personal/createpdf.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/gelirmodel.dart';
import 'package:aoa/service/provider/gidermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Ön İzleme"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const Text("Uygulama ismi gelecek"),
                      const Text(""),
                      Text("Tarih: ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3,),
              Container(
                width: double.infinity,
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer<PersonalModel>(
                    builder: (context, value, child) {
                      if(value.searchList.isNotEmpty){
                        return ListView.builder(
                          itemCount: value.searchList.length,
                          itemBuilder: (context, index){
                            var i = value.list[index];
                            if(i.tur == "0"){
                              context.read<GiderModel>().valChange(context.read<GiderModel>().valRead() + i.ucret);
                            }
                            if(i.tur == "1"){
                              context.read<GelirModel>().valChange(context.read<GelirModel>().valRead() + i.ucret);
                            }
                            if(i.tur == "2"){
                              context.read<GelirModel>().valChange(context.read<GelirModel>().valRead() + i.ucret);
                            }
                            return Card(
                              child: ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(i.tur == "1")
                                      const Text("Gelir"),
                                    if(i.tur == "0")
                                      const Text("Gider"),
                                    if(i.tur == "2")
                                      const Text("Mesai"),
                                  ],
                                ),
                                title: Text(i.yapilanis),
                                subtitle: Text("${i.ucret} tl"),
                                trailing: Text(i.tarih),
                              ),
                            );
                          },
                        );
                      }else{
                        return const Center(child: Text("Yapılmış kayıt yok"),);
                      }
                    }),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
/*                      Text("Toplam kazanılan: ${context.watch<GelirModel>().valRead()}"),
                      Text("Toplam harcanan: ${context.watch<GiderModel>().valRead()}"),
                      SizedBox(
                        width: 170,
                        height: 10,
                        child: const Divider(color: Colors.black,height: 3),
                      ),
                      Text("Sonuc: ${context.watch<GelirModel>().valRead() - context.watch<GiderModel>().valRead()}"),*/
                      const SizedBox(height: 15,),
                      ElevatedButton(
                        child: const Text("Kayıt Et"),
                        onPressed: ()async{
                          var result = await PersonalDao().read();
                          List<Personal> model = result;
                          createPDF(model, context.read<GelirModel>().valRead(), context.read<GiderModel>().valRead());
                        },
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
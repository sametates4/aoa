import 'package:aoa/service/model/worker.dart';
import 'package:aoa/service/pdf/worker/createpdf.dart';
import 'package:aoa/service/provider/calisanmodel.dart';
import 'package:aoa/service/provider/db/paramodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewPageWorker extends StatefulWidget {
  const PreviewPageWorker({Key? key}) : super(key: key);

  @override
  State<PreviewPageWorker> createState() => _PreviewPageWorkerState();
}

class _PreviewPageWorkerState extends State<PreviewPageWorker> {

  @override
  void initState() {
    Provider.of<WorkerModel>(context, listen: false).read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Ön izleme"),),
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
                child: Consumer<WorkerModel>(
                  builder: (context, value, child){
                    if(value.searchList.isNotEmpty){
                      return ListView.builder(
                        itemCount: value.searchList.length,
                        itemBuilder: (context, index){
                          var i = value.list[index];
                          context.read<CalisanModel>().valChange(value.searchList.length);
                          for(int i = 0; i < value.searchList.length; i++){
                            context.read<ParaModel>().valChange(context.read<ParaModel>().valRead() + value.searchList[i].toplamucret);
                          }
                          return Card(
                            child: ListTile(
                              title: Text(i.isimsoyisim),
                              subtitle: Text("${i.ucret} tl"),
                              trailing: Text(i.tarih),
                            ),
                          );
                        },
                      );
                    }else{
                      return const Center(child: Text("Yapılmış kayıt yok"),);
                    }
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 15,),
                      InkWell(
                        onTap: ()async {
                          var result = await context.read<WorkerModel>().searchList;
                          List<Worker> model = result;
                          createPDF(model, context.read<CalisanModel>().valRead(), context.read<ParaModel>().valRead(), context.read<MonthModel>().valRead());
                          context.read<CalisanModel>().valChange(0);
                          context.read<ParaModel>().valChange(0);
                          Navigator.pop(context);
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
                          child: const Center(child: Text("Pdf olarak dışa aktar", style: TextStyle(fontSize: 19),),),
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

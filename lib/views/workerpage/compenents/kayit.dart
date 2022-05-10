import 'package:aoa/service/db/calisanlardao.dart';
import 'package:aoa/service/model/calisanlar.dart';
import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/stackmodel.dart';
import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Kayit extends StatefulWidget {
  const Kayit({Key? key}) : super(key: key);

  @override
  State<Kayit> createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  @override
  void initState() {
    Provider.of<CalisanlarModel>(context, listen: false).read();
    super.initState();
  }

  final _isim = TextEditingController();
  final _telefon = TextEditingController();
  final _ucret = TextEditingController();
  final _yapilanis = TextEditingController();
  final _gun = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Çalışanlarım", style: TextStyle(fontSize: 19),),
                    IconButton(
                      icon: const Icon(Icons.list),
                      onPressed: (){
                        context.read<StackModel>().valChange(true);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 2,),
                TextField(
                  controller: _isim,
                  textInputAction: TextInputAction.next,
                  decoration: const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'İsim Soyisim',
                  ),
                ),
                const SizedBox(height: 12,),
                TextField(
                  controller: _telefon,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Telefon Numarası',
                  ),
                ),
                const SizedBox(height: 12,),
                TextField(
                  controller: _yapilanis,
                  textInputAction: TextInputAction.next,
                  decoration: const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Yapılan İş',
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.47,
                      height: 70,
                      child: TextField(
                        controller: _ucret,
                        textInputAction: TextInputAction.next,
                        decoration: const  InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ücret',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: size.width * 0.47,
                      height: 70,
                      child: TextField(
                        controller: _gun,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const  InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Çalışılan Gün',
                        ),
                      ),
                    ),
                  ],
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
                          final DateFormat formatter = DateFormat('dd/MM/yyyy');
                          final String formatted = formatter.format(e!);
                          context.read<TarihModel>().valChange(formatted);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          if(context.watch<StackModel>().valRead() == true)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<CalisanlarModel>(
                      builder: (context, value, child) {
                        if(value.list.isNotEmpty){
                          return ListView.builder(
                            itemCount: value.list.length,
                            itemBuilder: (context, index){
                              var i = value.list[index];
                              return Card(
                                child: ListTile(
                                  title: Text(i.isim),
                                  subtitle: Text(i.telefon),
                                  onTap: (){
                                      _isim.text = i.isim;
                                      _telefon.text = i.telefon;
                                      context.read<StackModel>().valChange(false);
                                  },
                                ),
                              );
                            },
                          );
                        }else{
                          return const Center(child: Text("Yapılmış kayıt yok"),);
                        }
                      }),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Kayıt et"),
        onPressed: (){
          int toplam = int.parse(_gun.text) * int.parse(_ucret.text);
          print(toplam);
          context.read<WorkerModel>().insert(_isim.text, int.parse(_ucret.text), context.read<TarihModel>().valRead(), int.parse(_gun.text), _yapilanis.text, toplam, _telefon.text);
          Get.back();
        },
      ),
    );
  }
}

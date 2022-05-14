import 'package:aoa/service/model/calisanlar.dart';
import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class CalisanlarimBottom extends StatelessWidget{

  late Calisanlar calisanlar;

  CalisanlarimBottom({required this.calisanlar});

  final _isim = TextEditingController();
  final _telefon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            TextField(
              controller: _isim,
              textInputAction: TextInputAction.next,
              decoration: const  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'İsim Soyisim',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextField(
              controller: _telefon,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefon Numarası',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Spacer(),
            SizedBox(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        context.read<CalisanlarModel>().update(_telefon.text, _isim.text, calisanlar.id);
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
import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget{
  Register({Key? key}) : super(key: key);
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
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    label: const Text("Kayıt Et"),
                    onPressed: (){
                      context.read<CalisanlarModel>().insert(_telefon.text, _isim.text);
                      Get.back();
                    },
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
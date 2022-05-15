import 'package:flutter/material.dart';

import '../../service/model/sirketgider.dart';

class SirketGiderDetay extends StatelessWidget {
  SirketGider gider;
  SirketGiderDetay({Key? key, required this.gider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gider: ${gider.gider}", style: TextStyle(fontSize: 19),),
            const SizedBox(height: 8,),
            Text("Tarih: ${gider.tarih}", style: TextStyle(fontSize: 19),),
            SizedBox(height: 8,),
            Text("Açıklama: ${gider.aciklama}", style: TextStyle(fontSize: 19),),
          ],
        ),
      ),
    );
  }
}

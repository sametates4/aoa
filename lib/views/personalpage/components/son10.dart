import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Son10 extends StatelessWidget {
  const Son10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<PersonalModel>(
          builder: (context, value, child) {
            if(value.list.isNotEmpty){
              return ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index){
                  var i = value.list[index];
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
      );
  }
}

import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Son10List extends StatelessWidget {
  const Son10List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Consumer<PersonalModel>(
          builder: (context, value, child) {
            if(value.list.isNotEmpty){
              return ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index){
                  var reserve = value.list.length - 1 - index;
                  var i = value.list[reserve];
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
                             Text("Mesai ${i.month}"),
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
    );
  }
}

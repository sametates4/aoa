import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calisanlarim extends StatelessWidget {
  const Calisanlarim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Çalışanlarım"),),
      body: Consumer<CalisanlarModel>(
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
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: (){
                          context.read<CalisanlarModel>().delete(i.id);
                        },
                      ),
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

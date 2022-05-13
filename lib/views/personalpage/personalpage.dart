import 'package:aoa/service/db/personaldao.dart';
import 'package:aoa/service/model/personal.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/views/bottomvawbar.dart';
import 'package:aoa/views/personalpage/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonaPage extends StatefulWidget {
  const PersonaPage({Key? key}) : super(key: key);

  @override
  State<PersonaPage> createState() => _PersonaPageState();
}

class _PersonaPageState extends State<PersonaPage> {
  late int toplamgelir = 0;
  late int toplamgider = 0;
  
  @override
  void initState() {
    Provider.of<PersonalModel>(context, listen: false).read();
    super.initState();
  }

  getData()async{
    var result = await PersonalDao().read();
    List<Personal> model = result;
    print(model.length);
    for(int i = 0; i < model.length; i++){
      if(model[i].tur == "0"){
        toplamgider = toplamgider + model[i].ucret;
      }
      if(model[i].tur == "1"){
        toplamgelir = toplamgelir + model[i].ucret;
      }
      if(model[i].tur == "2"){
        toplamgelir = toplamgelir + model[i].ucret;
      }
    }
    print("toplam kazanç: ${toplamgelir}");
    print("toplam gider: ${toplamgider}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa"),),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

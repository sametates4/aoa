
import 'package:aoa/views/ozetgrafik/components/personalchart.dart';
import 'package:aoa/views/ozetgrafik/components/workerchart.dart';
import 'package:flutter/material.dart';

class OzetGrafik extends StatefulWidget {
  const OzetGrafik({Key? key}) : super(key: key);

  @override
  State<OzetGrafik> createState() => _OzetGrafikState();
}

class _OzetGrafikState extends State<OzetGrafik> {

  var sayfalist = [PersonalChart(), WorkerChart()];
  late int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Özet Grafik"),),
      body: sayfalist[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kişisel Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Çalışanlar Grafik',
          ),
        ],
        currentIndex: index,
        onTap: (i){
          setState((){
            index = i;
          });
        },
      ),
    );
  }
}

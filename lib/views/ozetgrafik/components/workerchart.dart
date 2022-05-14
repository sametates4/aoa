import 'package:aoa/service/provider/workertoplamcalisan.dart';
import 'package:aoa/service/provider/workertoplamgider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkerChart extends StatefulWidget {
  const WorkerChart({Key? key}) : super(key: key);

  @override
  State<WorkerChart> createState() => _WorkerChartState();
}

class _WorkerChartState extends State<WorkerChart> {
  int touchedIndex = -1;
  late int monthindex = DateTime.now().month;
  final month = [
    "",
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${month[monthindex]} Ayı Özet Grafik", style: TextStyle(fontSize: 20),),
        const SizedBox(height: 10),
        if(context.read<WorkerToplamCalisan>().valRead() == 0)
          if(context.read<WorkerToplamGider>().valRead() == 0)
              Text("Gösterilicek veri yok"),
        AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 90,
                          sections: showingSections()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text("Toplam Verilecek olan para: ${context.read<WorkerToplamGider>().valRead()} Tl"),
        Text("Toplam Yapılan iş: ${context.read<WorkerToplamCalisan>().valRead()}"),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: context.watch<WorkerToplamGider>().valRead().toDouble(),
            title: 'Para',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: context.watch<WorkerToplamCalisan>().valRead().toDouble(),
            title: 'İş',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

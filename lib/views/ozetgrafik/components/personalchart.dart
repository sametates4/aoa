import 'package:aoa/service/provider/chartgelir.dart';
import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/chartmesai.dart';
import 'package:aoa/service/provider/chartsaat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class PersonalChart extends StatefulWidget {
  const PersonalChart({Key? key}) : super(key: key);

  @override
  State<PersonalChart> createState() => _PersonalChartState();
}

class _PersonalChartState extends State<PersonalChart> {
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
        if(context.read<ChartGiderModel>().valRead() == 0)
          if(context.read<ChartGelirModel>().valRead() == 0)
            if(context.read<ChartSaatModel>().valRead() == 0)
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
        Text("Toplam Kazanılan: ${context.read<ChartGelirModel>().valRead()+context.watch<ChartMesaiModel>().valRead()} Tl"),
        Text("Toplam Gider: ${context.read<ChartGiderModel>().valRead()} Tl"),
        Text("Toplam Mesai: ${context.read<ChartSaatModel>().valRead()} Saat"),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: context.watch<ChartSaatModel>().valRead().toDouble(),
            title: 'Saat',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: context.watch<ChartGelirModel>().valRead().toDouble(),
            title: 'Gelir',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: context.watch<ChartGiderModel>().valRead().toDouble(),
            title: 'Gider',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: context.watch<ChartMesaiModel>().valRead().toDouble(),
            title: 'Mesai',
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

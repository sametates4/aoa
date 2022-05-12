import 'package:aoa/service/provider/chartgelir.dart';
import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/chartmesai.dart';
import 'package:aoa/service/provider/chartsaat.dart';
import 'package:aoa/views/personalpage/components/son10list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Son10 extends StatelessWidget {
  Son10({Key? key}) : super(key: key);
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 375,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.orangeAccent,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
            ]),
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 90,
                          sections: [
                            PieChartSectionData(
                              color: const Color(0xff0293ee),
                              value: context.watch<ChartSaatModel>().valRead().toDouble(),
                              title: 'Saat',
                              //radius: radius,
                              titleStyle: const TextStyle(
                                //fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ),
                            PieChartSectionData(
                              color: const Color(0xfff8b250),
                              value: context.watch<ChartGelirModel>().valRead().toDouble(),
                              title: 'Gelir',
                              //radius: radius,
                              titleStyle: const TextStyle(
                                //fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ),
                            PieChartSectionData(
                              color: const Color(0xff845bef),
                              value: context.watch<ChartGiderModel>().valRead().toDouble(),
                              title: 'Gider',
                              //radius: radius,
                              titleStyle: const TextStyle(
                                //fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ),
                            PieChartSectionData(
                              color: const Color(0xff13d38e),
                              value: context.watch<ChartMesaiModel>().valRead().toDouble(),
                              title: 'Mesai',
                              //radius: radius,
                              titleStyle: const TextStyle(
                                //fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            value: 23,
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
            value: 10,
            title: 'Mesai',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 45,
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
            value: 52,
            title: 'Gelir',
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

import 'package:aoa/service/provider/calisanmodel.dart';
import 'package:aoa/service/provider/chartgelir.dart';
import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/chartmesai.dart';
import 'package:aoa/service/provider/chartsaat.dart';
import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:aoa/service/provider/db/paramodel.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/gelirmodel.dart';
import 'package:aoa/service/provider/gidermodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:aoa/service/provider/stackmodel.dart';
import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:aoa/views/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonalModel()),
        ChangeNotifierProvider(create: (_) => WorkerModel()),
        ChangeNotifierProvider(create: (_) => TarihModel()),
        ChangeNotifierProvider(create: (_) => GelirModel()),
        ChangeNotifierProvider(create: (_) => GiderModel()),
        ChangeNotifierProvider(create: (_) => CalisanlarModel()),
        ChangeNotifierProvider(create: (_) => StackModel()),
        ChangeNotifierProvider(create: (_) => GunModel()),
        ChangeNotifierProvider(create: (_) => MonthModel()),
        ChangeNotifierProvider(create: (_) => ChartGelirModel()),
        ChangeNotifierProvider(create: (_) => ChartGiderModel()),
        ChangeNotifierProvider(create: (_) => ChartMesaiModel()),
        ChangeNotifierProvider(create: (_) => ChartSaatModel()),
        ChangeNotifierProvider(create: (_) => CalisanModel()),
        ChangeNotifierProvider(create: (_) => ParaModel()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
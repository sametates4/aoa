import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/gelirmodel.dart';
import 'package:aoa/service/provider/gidermodel.dart';
import 'package:aoa/service/provider/stackmodel.dart';
import 'package:aoa/service/provider/tarihbaslangicmodel.dart';
import 'package:aoa/service/provider/tarihbitismodel.dart';
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
        ChangeNotifierProvider(create: (_) => TarihBaslangicModel()),
        ChangeNotifierProvider(create: (_) => TarihBitisModel()),
        ChangeNotifierProvider(create: (_) => CalisanlarModel()),
        ChangeNotifierProvider(create: (_) => StackModel()),
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
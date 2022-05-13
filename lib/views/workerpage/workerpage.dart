import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/views/bottomvawbar.dart';
import 'package:aoa/views/workerpage/compenents/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({Key? key}) : super(key: key);

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {

  @override
  void initState() {
    Provider.of<WorkerModel>(context, listen: false).read();
    Provider.of<CalisanlarModel>(context, listen: false).read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana sayfa"),),
      body: const Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

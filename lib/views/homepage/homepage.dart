import 'package:aoa/views/personalpage/personalpage.dart';
import 'package:aoa/views/workerpage/workerpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Çalışanım İçin Hesapla"),
              onPressed: (){
                Get.to(const WorkerPage());
              },
            ),
            ElevatedButton(
              child: const Text("Kendim İçin Hesapla"),
              onPressed: (){
                Get.to(const PersonaPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

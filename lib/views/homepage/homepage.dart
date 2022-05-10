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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(() => const WorkerPage());
                  },
                    child: Image.asset("assets/worker.png", width: 100, height: 110,)
                ),
                const Text("Çalışanım için hesapla", style: TextStyle(fontSize: 20),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(() =>  const PersonaPage());
                  },
                    child: Image.asset("assets/personal.png", width: 95, height: 110,)),
                const Text("Kendim İçin Hesapla", style: TextStyle(fontSize: 20),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

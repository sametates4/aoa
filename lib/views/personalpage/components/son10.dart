import 'package:aoa/views/personalpage/components/son10list.dart';
import 'package:flutter/material.dart';

class Son10 extends StatelessWidget {
  const Son10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 375,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: const [
             Text("Son 10 işlem", style: TextStyle(fontSize: 18),),
            SizedBox(height: 3,),
            Son10List(),
          ],
        ),
        ),
      );
  }
}

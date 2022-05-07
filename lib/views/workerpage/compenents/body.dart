import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Kayıt Ekle"),
              onPressed: (){},
            ),
            ElevatedButton(
              child: const Text("Kayıt Güncelle"),
              onPressed: (){},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Kayıt Görüntüle"),
              onPressed: (){},
            ),
            ElevatedButton(
              child: const Text("Çalışanlarım"),
              onPressed: (){},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.save_outlined),
              label: const Text("Rapor Oluştur"),
              onPressed: (){},
            ),
          ],
        ),
      ],
    );
  }
}

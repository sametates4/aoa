import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  String image;

  CustomButton(this.title, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.teal,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(2, 3),
            ),
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(-4, -4),
            ),
          ]),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Image.asset(image, height: 83,),
          const SizedBox(height: 8,),
          //const Spacer(),
          Text(title, style: const TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}

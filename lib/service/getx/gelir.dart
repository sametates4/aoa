import 'package:get/get.dart';

class pdfController extends GetxController{
  var sayac = 0.obs;
  var gelir = 0.obs;

  int valRead(){
    return sayac.value;
  }

  int gelRead(){
    return gelir.value;
  }

  void valChange(int val){
    sayac.value = sayac.value + val;
  }

  void gelAdd(int val){
    gelir.value = gelir.value + val;
  }
}
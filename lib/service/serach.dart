import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Search{
  String month;
  BuildContext context;
  Search({required this.month, required this.context});

  String search(){
    if(month == "Ocak"){
      context.read<PersonalModel>().search(int.parse("1${DateTime.now().year}"));
      return "olumlu";
    }else{
      if(month == "Şubat"){
        context.read<PersonalModel>().search(int.parse("2${DateTime.now().year}"));
        return "olumlu";
      }else{
        if(month == "Mart"){
          context.read<PersonalModel>().search(int.parse("3${DateTime.now().year}"));
          return "olumlu";
        }else{
          if(month == "Nisan"){
            context.read<PersonalModel>().search(int.parse("4${DateTime.now().year}"));
            return "olumlu";
          }else{
            if(month == "Mayıs"){
              context.read<PersonalModel>().search(int.parse("5${DateTime.now().year}"));
              print("01/05/${DateTime.now().year}");
              return "olumlu";
            }else{
              if(month == "Haziran"){
                context.read<PersonalModel>().search(int.parse("6${DateTime.now().year}"));
                return "olumlu";
              }else{
                if(month == "Temmuz"){
                  context.read<PersonalModel>().search(int.parse("7${DateTime.now().year}"));
                  return "olumlu";
                }else{
                  if(month == "Ağustos"){
                    context.read<PersonalModel>().search(int.parse("8${DateTime.now().year}"));
                    return "olumlu";
                  }else{
                    if(month == "Eylül"){
                      context.read<PersonalModel>().search(int.parse("9${DateTime.now().year}"));
                      return "olumlu";
                    }else{
                      if(month == "Ekim"){
                        context.read<PersonalModel>().search(int.parse("10${DateTime.now().year}"));
                        return "olumlu";
                      }else{
                        if(month == "Kasım"){
                          context.read<PersonalModel>().search(int.parse("11${DateTime.now().year}"));
                          return "olumlu";
                        }else{
                          if(month == "Aralık"){
                            context.read<PersonalModel>().search(int.parse("12${DateTime.now().year}"));
                            return "olumlu";
                          }else{
                            return "olumsuz";
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
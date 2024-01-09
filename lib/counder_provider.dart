import 'package:flutter/material.dart';
class counterModel extends ChangeNotifier{
  int counter=0;

  void increment(){
    counter++;
    notifyListeners();
}
}
import 'package:flutter/cupertino.dart';

class BottomMenuNotifier extends ChangeNotifier{

  late int value = 0; 

  void setValue(int val){
    value = val;
    notifyListeners();
  }
  int get getValue{
    return value;
  }
}
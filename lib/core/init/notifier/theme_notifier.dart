import 'package:flutter/material.dart';
import 'package:flutterproject/core/constants/enums/shared_keys_enum.dart';
import 'package:flutterproject/core/init/shared_preferences/shared_manager.dart';

class ThemeNotifier extends ChangeNotifier {
  
  bool isLightTheme = false;
  late final SharedManager _manager;

  ThemeNotifier(){
    _manager =SharedManager();
    _manager.init();
   

  }
  


  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  bool get getIsLightTheme {
    return isLightTheme;
  }

  ThemeData get currentTheme =>
      isLightTheme ? ThemeData.light() : ThemeData.dark();


Future<void> loadTheme() async{
  
 isLightTheme =await _manager.getSaveBool(SharedKeys.themeDark) ?? true;
 notifyListeners();
 
 
 }
}

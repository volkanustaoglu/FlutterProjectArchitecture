import 'package:flutter/cupertino.dart';
import 'package:flutterproject/core/constants/enums/shared_keys_enum.dart';
import 'package:flutterproject/core/init/shared_preferences/shared_manager.dart';

class LanguageNotifier extends ChangeNotifier{

  onLanguageChanged(){
    notifyListeners();
  }


}
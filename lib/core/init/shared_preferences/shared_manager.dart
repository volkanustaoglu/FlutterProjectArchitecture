import 'package:flutterproject/core/constants/enums/shared_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedManager{
  SharedPreferences? preferences;

  SharedManager();
  
  Future<void> init() async{
    preferences = await SharedPreferences.getInstance();
  }
  
  Future<void> saveBool(SharedKeys key,bool value)async {
    await preferences?.setBool(key.name, value);
  }

  Future<bool?> getSaveBool(SharedKeys key) async {
    return preferences?.getBool(key.name) ?? false;
  }
  Future<bool> removeSaveBool(SharedKeys key) async{
    return await preferences?.remove(key.name) ??false;
  }

  Future<void> saveString(SharedKeys key,String value)async {
    await preferences?.setString(key.name, value);
  }
  String? getSaveString(SharedKeys key)  {
    return preferences?.getString(key.name) ?? "";
  }
  

}
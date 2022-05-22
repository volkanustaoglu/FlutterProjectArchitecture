import 'dart:io';

import 'package:flutterproject/core/models/user.dart';
import 'package:flutterproject/core/services/methods/base_manager.dart';

class UserManager {
  static UserManager? _instance;
  
  UserManager._internal();
  
   static UserManager? getInstance() {
    return _instance ??= UserManager._internal();
  }

  Future<User?> GetAll() async {
     var response = await BaseManager.getInstance()!.jsonplaceholderApi()!.get('User');
    List<User> result = [];
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is Map<String, dynamic>) {
        return User.fromJson(_datas);
      }
      return null;
    }
  }
}

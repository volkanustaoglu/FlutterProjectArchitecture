import 'package:flutter/cupertino.dart';
import 'package:flutterproject/core/models/user.dart';
import 'package:flutterproject/core/services/abstract/user_repository.dart';

class UserViewModelProvider extends ChangeNotifier {
  UserViewModelProvider({required this.userRepository}) {
    _fetchGetAll();
  }
  UserRepository userRepository;
  List<Data> getData = [];

  bool _isLoading = false;
  void _changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  bool get getIsLoading {
    return _isLoading;
  }


  Future<void> _fetchGetAll() async {
    _changeLoading();
    getData = (await userRepository.getAll())?.data ?? [];
    _changeLoading();
  }
}

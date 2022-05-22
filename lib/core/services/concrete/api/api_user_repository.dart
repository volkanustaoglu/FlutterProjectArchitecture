import 'package:flutterproject/core/models/user.dart';
import 'package:flutterproject/core/services/abstract/user_repository.dart';
import 'package:flutterproject/core/services/methods/api_methods/user_manager.dart';

class ApiUserRepository extends UserRepository {
  @override
  Future<List<User>> create(User entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User?> getAll() async {
    var result = await UserManager.getInstance()!.GetAll();
    return result;
  }

  @override
  Future<User> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> update(User entity) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

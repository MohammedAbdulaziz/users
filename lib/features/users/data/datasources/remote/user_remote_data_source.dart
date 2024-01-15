import 'package:users/features/users/users.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getUsers();
}

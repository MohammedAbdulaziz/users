import 'package:dartz/dartz.dart';
import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}

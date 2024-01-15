import 'package:dartz/dartz.dart';
import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

class GetUsers {
  final UserRepository _userRepository;

  GetUsers(this._userRepository);

  Future<Either<Failure, List<User>>> call() async {
    final result = await _userRepository.getUsers();
    return result;
  }
}

import 'package:dartz/dartz.dart';
import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final users = await remoteDataSource.getUsers();

        return Right(users.toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

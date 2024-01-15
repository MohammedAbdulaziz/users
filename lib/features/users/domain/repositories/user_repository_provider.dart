import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final remoteDataSource = ref.watch(userRemoteDataSourceProvider(httpClient));
  final networkInfo = ref.watch(networkInfoProvider);
  return UserRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

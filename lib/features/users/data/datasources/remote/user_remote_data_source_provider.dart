import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/features/users/users.dart';

final userRemoteDataSourceProvider =
    Provider.family<UserRemoteDataSource, UserHttpClient>((_, httpClient) {
  return UserRemoteDataSourceImpl(httpClient: httpClient);
});

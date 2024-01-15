import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/features/users/users.dart';

final getUsersUseCaseProvider = Provider<GetUsers>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetUsers(repository);
});

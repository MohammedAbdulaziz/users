import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/features/users/users.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  final usersUsecase = ref.read(getUsersUseCaseProvider);
  return UsersNotifier(usersUsecase);
});

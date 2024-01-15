import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/features/users/users.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this._users) : super(const UsersState(isLoading: false));

  final GetUsers _users;

  Future<void> fetchUsers() async {
    state = const UsersState(isLoading: true);
    final result = await _users();
    state = result.fold(
      (failure) => UsersState(
        isLoading: false,
        errorMessage: Helpers.failureToMessage(failure),
      ),
      (users) => UsersState(
        users: users,
        isLoading: false,
      ),
    );
  }
}

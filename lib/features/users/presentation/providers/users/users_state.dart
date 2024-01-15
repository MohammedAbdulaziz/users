import 'package:equatable/equatable.dart';
import 'package:users/features/users/users.dart';

class UsersState extends Equatable {
  final List<User>? users;
  final bool isLoading;
  final String? errorMessage;

  const UsersState({
    this.users,
    this.errorMessage,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [users, isLoading, errorMessage];
}

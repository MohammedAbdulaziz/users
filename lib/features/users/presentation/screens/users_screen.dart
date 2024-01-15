import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users/features/users/users.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({
    super.key,
  });

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(usersProvider.notifier).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    final usersState = ref.watch(usersProvider);
    final users = usersState.users;
    final isLoading = usersState.isLoading;
    final errorMessage = usersState.errorMessage;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Users')),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLoading)
                const UserListShimmer(
                  key: Key('UserListShimmer'),
                ),
              if (users != null) UserList(users: users),
              if (errorMessage != null)
                DisplayMessage(
                  key: const Key('DisplayMessage'),
                  message: errorMessage,
                ),
              if (users == null && errorMessage != null)
                const DisplayMessage(
                  message: 'Connect to the internt to fetch users',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

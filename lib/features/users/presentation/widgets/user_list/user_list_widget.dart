import 'package:flutter/material.dart';
import 'package:users/features/users/users.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        thickness: 1,
        color: Colors.grey[300]!.withOpacity(0.3),
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return UserTile(
          key: Key('${user.id}'),
          user: user,
        );
      },
    );
  }
}

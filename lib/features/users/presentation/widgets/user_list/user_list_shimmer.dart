import 'package:flutter/material.dart';
import 'package:users/features/users/users.dart';

class UserListShimmer extends StatelessWidget {
  const UserListShimmer({
    super.key,
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
      itemCount: 6,
      itemBuilder: (context, index) {
        return UserTileShimmer(
          key: Key('$index'),
        );
      },
    );
  }
}

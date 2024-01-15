import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:users/config/config.dart';
import 'package:users/features/users/users.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {
          context.pushNamed(
            RoutesName.userDetail,
            extra: user,
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                width: 101.r,
                height: 101.r,
                child: Center(
                  child: Text(
                    user.name[0],
                    style: Theme.of(context).textTheme.headlineLarge!,
                  ),
                ),
              ),
              SizedBox(width: 12.39.w),
              SizedBox(
                height: 101.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DescriptionRow(
                            icon: Icons.email_outlined,
                            text: user.email,
                            size: 20.r,
                            sizedBoxWidth: 200.w,
                          ),
                          DescriptionRow(
                            icon: Icons.phone_outlined,
                            text: user.phone,
                            size: 20.r,
                            sizedBoxWidth: 200.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

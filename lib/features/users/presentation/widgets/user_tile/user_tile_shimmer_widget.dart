import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users/features/users/users.dart';

class UserTileShimmer extends StatelessWidget {
  const UserTileShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 150.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.93),
                    child: ShimmerWidget(
                      height: 101.h,
                      width: 101.h,
                      borderRadius: 10,
                    )),
                SizedBox(width: 12.39.w),
                SizedBox(
                  height: 101.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget(
                        height: 22.h,
                        width: 150,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          ShimmerWidget(
                            height: 18.36.h,
                            width: 200.w,
                          ),
                          SizedBox(height: 10.h),
                          ShimmerWidget(
                            height: 18.36.h,
                            width: 200.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

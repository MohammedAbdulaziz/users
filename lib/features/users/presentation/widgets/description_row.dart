import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionRow extends StatelessWidget {
  final String text;
  final double size;
  final double sizedBoxWidth;
  final IconData icon;

  const DescriptionRow({
    super.key,
    required this.icon,
    required this.size,
    required this.text,
    required this.sizedBoxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 6.23.w),
        SizedBox(
          width: sizedBoxWidth,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isCircle;

  const ShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 20,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      direction: ShimmerDirection.ltr,
      baseColor: const Color(0xFF3A3A3A),
      highlightColor: const Color(0xFF3A3A3A).withOpacity(0.5),
      period: const Duration(milliseconds: 800),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 143, 143, 143),
          borderRadius: isCircle
              ? BorderRadius.circular(width! / 2)
              : BorderRadius.all(Radius.circular(borderRadius!)),
        ),
      ),
    );
  }
}

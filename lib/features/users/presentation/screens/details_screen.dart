import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:users/features/users/users.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.user,
  });

  final User user;

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  user.name[0],
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const Back(),
          ]),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                ),
                SizedBox(height: 40.h),
                InkWell(
                  onTap: () async {
                    final Uri uri = Uri.parse('mailto:${user.email}');
                    _launchUrl(uri);
                  },
                  child: DescriptionRow(
                    icon: Icons.email,
                    size: 20.sp,
                    text: user.email,
                    sizedBoxWidth: MediaQuery.of(context).size.width - 50,
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () async {
                    final Uri uri = Uri.parse('tel:${user.phone}');
                    _launchUrl(uri);
                  },
                  child: DescriptionRow(
                    icon: Icons.phone,
                    size: 20.sp,
                    text: user.phone,
                    sizedBoxWidth: MediaQuery.of(context).size.width - 50,
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () async {
                    MapsLauncher.launchCoordinates(
                        double.parse(user.address.geo.lat),
                        double.parse(user.address.geo.lng),
                        user.name);
                  },
                  child: DescriptionRow(
                    icon: Icons.location_on,
                    size: 20.sp,
                    text:
                        '${user.address.street}, ${user.address.suite}, ${user.address.city}',
                    sizedBoxWidth: MediaQuery.of(context).size.width - 50,
                  ),
                ),
                SizedBox(height: 20.h),
                DescriptionRow(
                  icon: Icons.business,
                  size: 20.sp,
                  text: user.company.name,
                  sizedBoxWidth: 200.w,
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () async {
                    final Uri uri = Uri.parse('https://${user.website}');
                    _launchUrl(uri);
                  },
                  child: DescriptionRow(
                    icon: Icons.public,
                    size: 20.sp,
                    text: user.website,
                    sizedBoxWidth: MediaQuery.of(context).size.width - 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

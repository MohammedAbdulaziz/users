import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users/config/theme/app_theme.dart';
import 'package:users/config/router/router.dart';

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Users App',
          theme: AppTheme.darkTheme,
          routerConfig: RoutesConfig.routeConfig,
        );
      },
    );
  }
}

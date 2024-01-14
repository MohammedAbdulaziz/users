import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users/screens/home_page.dart';
import 'package:users/theme/app_theme.dart';

void main() {
  runApp(const UsersApp());
}

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Users App',
          theme: AppTheme.darkTheme(context),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}

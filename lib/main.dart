import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/route/app_page.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/theme/app_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: AppPage.list,
          initialRoute: AppRoute.splash,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: (context, widget) {
            ScreenUtil.init(
                context); // Đảm bảo ScreenUtil được khởi tạo tại đây
            return widget!;
          },
        );
      },
    );
  }
}

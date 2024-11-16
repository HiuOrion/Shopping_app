import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/route/app_page.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/theme/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 896),
      minTextAdapt: true,
      builder: (context, child){
        return GetMaterialApp(
          getPages: AppPage.list,
          initialRoute: AppRoute.splash,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: (context, widget) {
            ScreenUtil.init(context); // Đảm bảo ScreenUtil được khởi tạo tại đây
            return widget!;
          },
        );
      },
    );
  }
}

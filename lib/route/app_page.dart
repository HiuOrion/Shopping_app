import 'package:get/get.dart';

import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/view/dashboard/dashboard_binding.dart';
import 'package:shopping_app/view/dashboard/dashboard_screen.dart';
import 'package:shopping_app/view/forgot_pass/forgot_pass_screen.dart';
import 'package:shopping_app/view/login/log_in_binding.dart';
import 'package:shopping_app/view/login/log_in_screen.dart';
import 'package:shopping_app/view/sign_up/sign_up_binding.dart';
import 'package:shopping_app/view/sign_up/sign_up_screen.dart';
import 'package:shopping_app/view/splash/splash_screen.dart';

import '../view/forgot_pass/forgot_pass_binding.dart';

class AppPage {
  static var list = [

    //Định nghĩa các tuyến đường
    GetPage(
        name: AppRoute.splash,
        page: () => const SplashScreen()),
    GetPage(
        name: AppRoute.dashBoard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
        name: AppRoute.logIn,
        page: () => const LogInScreen(),
        binding: LogInBinding()),
    GetPage(
        name: AppRoute.signUp,
        page: () => const SignUpScreen(),
        binding: SignUpBinding(),
    ),
    GetPage(
        name: AppRoute.forgotPass,
        page: () => const ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
  ];
}

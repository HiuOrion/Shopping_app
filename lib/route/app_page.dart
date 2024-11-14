import 'package:get/get.dart';
import 'package:shopping_app/view/account/account_binding.dart';
import 'package:shopping_app/view/account/account_screen.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/view/dashboard/dashboard_binding.dart';
import 'package:shopping_app/view/dashboard/dashboard_screen.dart';
import 'package:shopping_app/view/explore/explore_screen.dart';
import 'package:shopping_app/view/favorite_product/favorite_product_binding.dart';
import 'package:shopping_app/view/forgot_pass/forgot_pass_screen.dart';
import 'package:shopping_app/view/home/home_binding.dart';
import 'package:shopping_app/view/home/home_screen.dart';
import 'package:shopping_app/view/login/log_in_binding.dart';
import 'package:shopping_app/view/login/log_in_screen.dart';
import 'package:shopping_app/view/my_cart/my_cart_binding.dart';
import 'package:shopping_app/view/my_cart/my_cart_screen.dart';
import 'package:shopping_app/view/product/product_binding.dart';
import 'package:shopping_app/view/product/product_screen.dart';
import 'package:shopping_app/view/product_detail/product_detail_screen.dart';
import 'package:shopping_app/view/sign_up/sign_up_binding.dart';
import 'package:shopping_app/view/sign_up/sign_up_screen.dart';
import 'package:shopping_app/view/splash/splash_screen.dart';
import 'package:shopping_app/view/top_product/top_product_grid.dart';

import '../view/favorite_product/favorite_product_screen.dart';
import '../view/forgot_pass/forgot_pass_binding.dart';
import '../view/product_detail/product_detail_binding.dart';

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
    GetPage(
        name: AppRoute.home,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoute.product,
        page: () => const ProductScreen(),
        binding: ProductBinding()),
    GetPage(
        name: AppRoute.productDetail,
        page: () => const ProductDetailScreen(),
        binding: ProductDetailBinding()),
    GetPage(
        name: AppRoute.favoriteProduct,
        page: () => const FavoriteProductScreen(),
        binding: FavoriteProductBinding()),
    GetPage(
      name: AppRoute.exploreCategory,
      page: () => const ExploreScreen(),
      ),
    GetPage(
      name: AppRoute.account,
      page: () => const AccountScreen(),
      binding: AccountBinding()
    ),
    GetPage(
        name: AppRoute.cart,
        page: () => const MyCartScreen(),
        binding: MyCartBinding()
    ),
    // GetPage(
    //     name: AppRoute.address,
    //     page: () => const AddressListView(),
    // ),
    GetPage(
        name: AppRoute.topProduct,
        page: () => const TopProductGrid(),
    ),


  ];
}

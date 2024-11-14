import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';
import 'package:shopping_app/view/account/account_screen.dart';
import 'package:shopping_app/view/dashboard/widgets/bottomNavigatorBar.dart';
import 'package:shopping_app/view/home/home_screen.dart';
import 'package:shopping_app/view/my_cart/my_cart_screen.dart';
import '../favorite_product/favorite_product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();


    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return IndexedStack(
            index: controller.tabIndex.value,
            children: [
              // Tab Home
              HomeScreen(),
              MyCartScreen(),
              FavoriteProductScreen(),
              AccountScreen(),
            ],
          );
        }),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: BottomNavigatorBar(),
      ),
    );
  }
}

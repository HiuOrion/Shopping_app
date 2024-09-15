import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';
import 'package:shopping_app/view/dashboard/widgets/bottomNavigatorBar.dart';
import 'package:shopping_app/view/favorite/favorite_screen.dart';
import 'package:shopping_app/view/home/home_binding.dart';
import 'package:shopping_app/view/home/home_screen.dart';
import 'package:shopping_app/view/product/product_binding.dart';
import 'package:shopping_app/view/product/product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final DashboardController controller = Get.find<DashboardController>();
    HomeBinding().dependencies();
    ProductBinding().dependencies();

    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Obx(() { //Sử dụng Obx cập nhật giao diện khi "tabIndex" thay đổi
            return IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeScreen(),
                Container(
                  color: Colors.red,
                ),
                FavoriteScreen(),
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
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: BottomNavigatorBar(),
        ),
      ),
    );
  }
}

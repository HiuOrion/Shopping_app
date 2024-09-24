import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';
import 'package:shopping_app/view/dashboard/widgets/bottomNavigatorBar.dart';
import 'package:shopping_app/view/home/home_binding.dart';
import 'package:shopping_app/view/home/home_screen.dart';
import 'package:shopping_app/view/my_cart/my_cart_screen.dart';
import 'package:shopping_app/view/product/product_binding.dart';
import '../../controller/favorite_product_controller.dart';
import '../favorite_product/favorite_product_binding.dart';
import '../favorite_product/favorite_product_screen.dart';

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
          child: Obx(() {
            return IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeScreen(),
                MyCartScreen(),
                if (controller.tabIndex.value == 2) ...[
                  // Tạo binding khi vào tab yêu thích và cập nhật danh sách
                  GetBuilder<DashboardController>(
                    initState: (_) {
                      FavoriteProductBinding().dependencies();
                      // Gọi API cập nhật danh sách
                      Get.find<FavoriteProductController>().getListFavoriteProduct();
                    },
                    builder: (_) => FavoriteProductScreen(),
                  ),

                ]
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

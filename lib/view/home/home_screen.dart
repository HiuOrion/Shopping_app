import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/home_controller.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/view/home/widgets/carousel_slider.dart';
import 'package:shopping_app/view/home/widgets/categories.dart';
import 'package:shopping_app/view/home/widgets/category_loading.dart';
import 'package:shopping_app/view/home/widgets/section_title.dart';
import 'package:shopping_app/view/top_product/top_product.dart';

import '../../route/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 150.w,),
                Container(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                // GestureDetector(
                //   onTap: (){
                //     Get.toNamed(AppRoute.cart);
                //   },
                //   child:
                //   badges.Badge(
                //
                //     // badgeContent: const Text(
                //     //   '2',
                //     //   style: TextStyle(color: Colors.white),
                //     // ),
                //     badgeStyle: badges.BadgeStyle(
                //       badgeColor: AppTheme.lightPrimaryColor,
                //     ),
                //     onTap: () {
                //     },
                //     badgeAnimation: const badges.BadgeAnimation.slide(),
                //     child: Container(
                //       height: 45,
                //       width: 45,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         shape: BoxShape.circle,
                //         boxShadow: <BoxShadow>[
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             blurRadius: 8,
                //           ),
                //         ],
                //       ),
                //       padding: const EdgeInsets.all(12),
                //       child: const Icon(Icons.add_shopping_cart),
                //     ),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Màu nền
                    shape: BoxShape.circle, // Hình dạng tròn
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Màu bóng mờ
                        spreadRadius: 1, // Độ lan của bóng
                        blurRadius: 8, // Độ mờ của bóng
                        offset: const Offset(0, 3), // Độ lệch bóng
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.chat);
                    },
                    icon: const Icon(Icons.chat_bubble_outline),
                    color: Colors.black, // Màu icon
                  ),
                )

              ],
            ),

            const SizedBox(height: 8,),

           const CarouselLoading(),

            const SizedBox(height: 8,),


            SectionTitle(
                title: "Hàng hoá",
                onPressed: () {
                  Get.toNamed(AppRoute.exploreCategory);
                }),

            const SizedBox(height: 8,),

            Obx(() {
              if (homeController.categoryList.isNotEmpty) {
                return Categories(categories: homeController.categoryList);
              } else {
                return const CategoryLoading();
              }
            }),
            const SizedBox(height: 8,),


            //Top product
            SectionTitle(
                title: "Sản phẩm bán chạy",
                onPressed: () {
                  Get.toNamed(AppRoute.topProduct);
                }),

            const SizedBox(height: 8,),

            const SizedBox(
                height: 253, width: double.infinity, child: TopProductView()),
          ],
        )),
      ),
    );
  }
}

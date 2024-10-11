import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/home_controller.dart';
import 'package:shopping_app/styles/font.dart';
import 'package:shopping_app/view/home/widgets/carousel_slider.dart';
import 'package:shopping_app/view/home/widgets/categories.dart';
import 'package:shopping_app/view/home/widgets/category_loading.dart';
import 'package:shopping_app/view/account/widgets/google_map.dart';
import 'package:shopping_app/view/home/widgets/main_header.dart';
import 'package:shopping_app/view/home/widgets/section_title.dart';

import '../../route/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();

  
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Material(
        child: SafeArea(
            child: Column(
                  children: [
            MainHeader(),
            CarouselLoading(),
            Row(
              children: [
                const SectionTitle(title: "Hàng hoá"),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.exploreCategory);
                  },
                  child: Text("Xem thêm",
                      style: secondaryLabel(
                          fontSize: 16,
                          color: Color.fromARGB(255, 83, 177, 117))),
                )
              ],
            ),
            Obx(() {
              if(controller.categoryList.isNotEmpty){
                // controller.categoryList.forEach((category) {
                //   print('Category: ${category.name}, ID: ${category.id}, Image: ${category.image}');
                // });
                return Categories(categories: controller.categoryList);
              }else{
                return CategoryLoading();
              }
            }),
          ],
        )),
      ),
    );
  }
}

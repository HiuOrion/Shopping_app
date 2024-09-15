import 'package:flutter/material.dart';
import 'package:shopping_app/controller/home_controller.dart';
import 'package:shopping_app/view/home/widgets/carousel_slider.dart';
import 'package:shopping_app/view/home/widgets/categories.dart';
import 'package:shopping_app/view/home/widgets/category_loading.dart';
import 'package:shopping_app/view/home/widgets/main_header.dart';

import 'package:get/get.dart';
import 'package:shopping_app/view/home/widgets/section_title.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();

  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Column(
      children: [
        MainHeader(),
        CarouselLoading(),
        const SectionTitle(title: "Hàng hoá"),
        Obx(() {
          if(controller.categoryList.isNotEmpty){
            // controller.categoryList.forEach((category) {
            //   print('Category: ${category.name}, ID: ${category.id}, Image: ${category.image}');
            // });
            return Categories(categories: controller.categoryList);
          }else{
            return CategoryLoading();
          }
        })
      ],
    ));
  }
}

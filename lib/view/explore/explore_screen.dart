import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/home_controller.dart';

import 'package:shopping_app/view/explore/widgets/explore_grid.dart';
import 'package:shopping_app/common/custom_appbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: CustomAppBar(
        isShowLeading: true,
        isShowCart: false,
        title: "Danh mục hàng hoá",
      ),
      body: ExploreGrid(categories: controller.categoryList),
    );
  }
}

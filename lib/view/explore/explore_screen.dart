import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/home_controller.dart';
import 'package:shopping_app/view/explore/widgets/explore_grid.dart';

import '../../styles/font.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        elevation: 0.5,
        title: Text(
          'Danh mục hàng hoá',
          style: title(fontSize: 24),
        ),
      ),
      body: ExploreGrid(categories: controller.categoryList),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/top_product_controller.dart';
import 'package:shopping_app/view/top_product/top_product_list.dart';

class TopProductView extends StatelessWidget {
  const TopProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final TopProductController _topProductController = Get.find<TopProductController>();

    return SafeArea(
      child: Obx(() {
        if (_topProductController.isTopProductLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return TopProductList(topProducts: _topProductController.listTopProduct);
      }),
    );
  }
}


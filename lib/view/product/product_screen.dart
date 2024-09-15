import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/view/home/widgets/main_header.dart';
import 'package:shopping_app/view/product/widget/product_grid.dart';
import 'package:shopping_app/view/product/widget/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 30, right: 5, bottom: 5),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: MainHeader(),
            ),
            Flexible(
              flex: 5,
              child: Obx(() {
                if (productController.productList.isNotEmpty) {
                  return ProductGrid(products: productController.productList);
                } else {
                  return const ProductLoadingGrid();
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

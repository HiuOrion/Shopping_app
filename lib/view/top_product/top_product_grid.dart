import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/custom_appbar.dart';
import 'package:shopping_app/controller/top_product_controller.dart';
import 'package:shopping_app/view/top_product/top_product_card.dart';

import '../../route/app_route.dart';

class TopProductGrid extends StatelessWidget {
  const TopProductGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final TopProductController _topProductController = Get.find<TopProductController>();

    return Scaffold(
      appBar: CustomAppBar(
        isShowLeading: true,
        isShowCart: false,
        title: "Sản phẩm bán chạy",
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: _topProductController.listTopProduct.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              final topProduct = _topProductController.listTopProduct[index];
              return InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.toNamed(AppRoute.productDetail, arguments: topProduct.id);
                },
                  child: TopProductCard(topProduct: topProduct),
              );
            }),
      ),
    );
  }
}

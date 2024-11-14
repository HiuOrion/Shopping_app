import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/top_product.dart';
import 'package:shopping_app/view/top_product/top_product_card.dart';

import '../../route/app_route.dart';

class TopProductList extends StatelessWidget {
  final List<TopProduct> topProducts;

  const TopProductList({super.key, required this.topProducts});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        width: media.width * 0.03,
      ),
      itemCount: topProducts.length,
      itemBuilder: (context, index) {
        final topProduct = topProducts[index];
        return Container(
          height: 248,
          width: 190,
          child: InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Get.toNamed(AppRoute.productDetail, arguments: topProduct.id);
              },
              child: TopProductCard(topProduct: topProduct)),
        );
      },
    );
  }
}

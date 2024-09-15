import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/product/widget/product_card.dart';
import '../../../models/product.dart';
import '../../../route/app_route.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index){
        final product = products[index];

        return InkWell(
          onTap: (){
            Get.toNamed(AppRoute.productDetail, arguments: product.id);
          },
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
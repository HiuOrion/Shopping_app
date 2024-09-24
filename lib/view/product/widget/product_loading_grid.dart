import 'package:flutter/material.dart';
import 'package:shopping_app/view/product/widget/product_loading_card.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3, //cao 3/2 rộng
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductLoadingCard(),
    );
  }
}
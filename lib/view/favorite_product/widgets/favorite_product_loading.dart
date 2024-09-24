import 'package:flutter/material.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_loading_card.dart';

class FavoriteProductLoading extends StatelessWidget {
  const FavoriteProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (ctx, index) => const FavoriteProductLoadingCard());
  }
}

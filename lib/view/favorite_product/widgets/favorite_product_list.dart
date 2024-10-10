import 'package:flutter/material.dart';
import 'package:shopping_app/models/favorite_product.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_card.dart';


class FavoriteProductList extends StatelessWidget {
  final List<FavoriteProduct> listFavoriteProduct;

  const FavoriteProductList({super.key, required this.listFavoriteProduct});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black26,
        height: 1,
      ),
        physics: BouncingScrollPhysics(),
        itemCount: listFavoriteProduct.length,
        itemBuilder: (ctx, index) =>  FavoriteProductCard(
                  favoriteProduct: listFavoriteProduct[index]),
            );
  }
}

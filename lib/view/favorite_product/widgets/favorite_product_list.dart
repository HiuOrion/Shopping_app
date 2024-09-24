import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/favorite_product.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_card.dart';

import '../../../controller/favorite_product_controller.dart';

class FavoriteProductList extends StatelessWidget {
  final List<FavoriteProduct> listFavoriteProduct;

  const FavoriteProductList({super.key, required this.listFavoriteProduct});

  @override
  Widget build(BuildContext context) {
    final FavoriteProductController controller = Get.find<FavoriteProductController>();


    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listFavoriteProduct.length,
        itemBuilder: (ctx, index) => SingleChildScrollView(
            child: Dismissible(
              key: Key(listFavoriteProduct[index].id.toString()),
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.red, // Màu nền khi trượt
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white), // Icon xóa
              ),
              onDismissed: (direction) {
                // Xử lý khi sản phẩm bị xóa khỏi danh sách yêu thích
                controller.removeFavoriteProduct(listFavoriteProduct[index].id.toString());
                Get.snackbar('Xóa', 'Sản phẩm đã bị bỏ khỏi yêu thích',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: FavoriteProductCard(
                  favoriteProduct: listFavoriteProduct[index]),
            )));
  }
}

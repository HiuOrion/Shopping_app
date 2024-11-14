import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/base_button.dart';
import 'package:shopping_app/controller/favorite_product_controller.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_list.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_loading_card.dart';
import 'package:shopping_app/common/custom_appbar.dart';

import '../../styles/font.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteProductController controller =
        Get.find<FavoriteProductController>();

    return Scaffold(
      appBar: CustomAppBar(
          isShowLeading: false,
          isShowCart: false,
          title: "Sản phẩm yêu thích"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.listFavoriteProduct.isEmpty) {
                  return Center(
                    child: Text(
                      'Danh sách yêu thích trống...',
                      style: kFontSubTitle(fontSize: 20),
                    ),
                  );
                }
                if (controller.listFavoriteProduct.isNull) {
                  return const FavoriteProductLoadingCard();
                } else {
                  return FavoriteProductList(
                      listFavoriteProduct: controller.listFavoriteProduct);
                }
              }),
            ),
            BaseButton(
              title: "Thêm hết vào giỏ hàng",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

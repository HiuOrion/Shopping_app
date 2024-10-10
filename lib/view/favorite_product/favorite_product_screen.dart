import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/favorite_product_controller.dart';
import 'package:shopping_app/styles/button.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_list.dart';
import 'package:shopping_app/view/favorite_product/widgets/favorite_product_loading_card.dart';

import '../../styles/font.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteProductController controller =
        Get.find<FavoriteProductController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,

        title: Text(
          'Sản phẩm yêu thích',
          style: kStyleTitle(fontSize: 24),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.listFavoriteProduct.isEmpty) {
                  return Center(child: Text('Danh sách yêu thích trống...', style: subtitle(fontSize: 20),),);
                } if(controller.listFavoriteProduct.isNull){
                  return const FavoriteProductLoadingCard();
                }else{
                  return FavoriteProductList(listFavoriteProduct: controller.listFavoriteProduct);
                }
              }),
            ),
            Container(
              height: 67,
                child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Thêm hết vào giỏ hàng',
                style: textButton,
              ),
              style: buttonPrimary,
            ))
          ],
        ),
      ),
    );
  }
}

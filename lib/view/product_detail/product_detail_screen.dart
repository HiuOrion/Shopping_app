import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/common/base_button.dart';
import 'package:shopping_app/controller/product_detail_controller.dart';

import '../../styles/font.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    final ProductDetailController controller =
        Get.put(ProductDetailController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.productDetail.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          final product = controller.productDetail.value!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: media.width * 0.8,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: product.id,
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          width: media.width * 0.8,
                          height: double.infinity,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: kFontTitle(fontSize: 24),
                            ),
                          ),
                          Obx(() => IconButton(
                                onPressed: () {
                                  controller.toggleFavoriteProduct();
                                },
                                icon: controller.isFavorite.value
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_outline_sharp),
                              )),
                        ],
                      ),
                      Text("Đơn vị: ${product.weight}",
                          style: kFontSubTitle(fontSize: 16)),
                      Text(
                        "Số lượng: ${product.quantity}",
                        style: kFontSubTitle(fontSize: 16),
                      ),
                      SizedBox(height: media.width * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove),
                                color: Colors.grey,
                                onPressed: controller.decreaseQuantity,
                              ),
                              Container(
                                // height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TextField(
                                  controller: TextEditingController(
                                      text: controller.quantityFinal.value
                                          .toString()),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: kFontTitle(fontSize: 18),
                                  onChanged: controller.updateQuantity,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.green,
                                onPressed: controller.increaseQuantity,
                              ),
                            ],
                          ),
                          Spacer(),

                          Text(
                            "${NumberFormat("#,##0", "vi_VN").format(product.price)} VNĐ",
                            style: kFontTitle(fontSize: 24),
                          ),
                        ],
                      ),

                      const Divider(color: Color.fromARGB(255, 237, 234, 234)),

                      Container(
                        width: double.infinity,
                        child: ExpansionTile(
                          title: Text(
                            'Chi tiết sản phẩm',
                            style: kFontTitle(fontSize: 18),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.description,
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: media.width * 0.05),

                      BaseButton(
                        title: "Thêm vào giỏ hàng",
                        onPressed: () {
                          controller.addToCart();
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

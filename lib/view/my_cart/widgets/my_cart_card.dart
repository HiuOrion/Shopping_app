import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/controller/my_cart_controller.dart';
import 'package:shopping_app/models/product_detail.dart';
import 'package:shopping_app/styles/font.dart';

class MyCartCard extends StatelessWidget {
  final ProductDetail productDetail;
  final int index;

  const MyCartCard({
    super.key,
    required this.productDetail,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    final MyCartController _cartController = Get.find<MyCartController>();

    return Container(
      height: media.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: productDetail.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: media.width * 0.03),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(productDetail.name,
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            style: kFontTitle(fontSize: 18)),
                      ),
                      InkWell(
                          onTap: () {
                            _cartController.removeFromCart(index);
                          },
                          child: Icon(Icons.highlight_remove_outlined)),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: media.height * 0.01),
                    child: Text(productDetail.weight,
                        style: kFontSubTitle(fontSize: 14)),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _cartController.decreaseQuantity(productDetail.id);
                        },
                        child: Container(
                            width: media.width * 0.1,
                            height: media.width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.remove,
                              color: Colors.grey,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.03),
                        child: Text(
                          (productDetail.quantity).toString(),
                          style: kFontSubTitle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _cartController.increaseQuantity(productDetail.id);
                        },
                        child: Container(
                            width: media.width * 0.1,
                            height: media.width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 83, 177, 117),
                            )),
                      ),
                      const Spacer(),
                      Text(
                        "${NumberFormat("#,##0", "vi_VN").format(productDetail.price * productDetail.quantity)} VNĐ",
                        style: kFontTitle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

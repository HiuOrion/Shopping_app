import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/common/custom_appbar.dart';
import 'package:shopping_app/controller/my_cart_controller.dart';
import 'package:shopping_app/styles/app_colors.dart';
import 'package:shopping_app/view/my_cart/widgets/checkout_view.dart';
import 'package:shopping_app/view/my_cart/widgets/my_cart_card.dart';

import '../../models/product_detail.dart';
import '../../styles/font.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyCartController controller = Get.find<MyCartController>();

    final media = MediaQuery.sizeOf(context);

    // Gọi loadCartItems mỗi khi màn hình giỏ hàng được hiển thị
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadCartItems();
    });

    return Scaffold(
      appBar: const CustomAppBar(
        isShowLeading: false,
        title: 'Giỏ hàng',
        isShowActions: false,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() => ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: controller.cartItems.length,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                ProductDetail productDetail = controller
                    .cartItems[index]; // Sử dụng đối tượng ProductDetail
                return MyCartCard(
                  productDetail: productDetail,
                  index: index,
                );
              })),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              if (controller.cartItems.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        showCheckout(context, controller);
                      },
                      height: media.height * 0.08,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      minWidth: double.maxFinite,
                      elevation: 0.1,
                      color: AppColors.primary,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Thanh toán",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              "${NumberFormat("#,##0", "vi_VN").format(controller.calculateTotalPrice())} VNĐ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "Giỏ hàng trống",
                    style: kFontTitle(fontSize: 30),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  void showCheckout(BuildContext context, MyCartController controller) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const CheckoutView();
      },
    );
  }
}
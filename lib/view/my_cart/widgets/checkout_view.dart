import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/controller/my_cart_controller.dart';
import 'package:shopping_app/styles/button.dart';
import 'package:shopping_app/styles/font.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final MyCartController controller = Get.find<MyCartController>();

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Padding(
        padding:

        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Checkout", style: kFontTitle(fontSize: 25)),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.highlight_remove),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.black26, height: 1),

                //Địa chỉ
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        "Thông tin người nhận",
                        style: kFontSubTitle(fontSize: 18),
                      ),
                      const Spacer(),
                      Obx(() => IconButton(
                          onPressed: () {
                            controller.toggleAddressExpanded();
                          },
                          icon: Icon(
                            controller.isAddressExpanded.value
                                ? Icons.expand_less
                                : Icons.expand_more,
                          )))
                    ],
                  ),
                ),
                Obx(() => controller.isAddressExpanded.value
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.addressController,
                              // Sử dụng controller
                              decoration: InputDecoration(
                                hintText: 'Địa chỉ giao hàng',
                                hintStyle: kFontSubTitle(fontSize: 16),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              ),
                              autofocus: true,
                              validator: (value){
                                if(value == null || value.isEmpty ){
                                  return "Không được để trống địa chỉ";
                                }
                              },

                            ),
                            SizedBox(height: media.height * 0.01,),
                            TextFormField(
                              controller: controller.phoneController,
                              // Sử dụng controller
                              decoration: InputDecoration(
                                  hintText: 'Số điện thoại người nhận',
                                  hintStyle: kFontSubTitle(fontSize: 16),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              validator: (value){
                                if(value == null || value.isEmpty ){
                                  return "Không được để trống số điện thoại";
                                }
                              },
                            ),
                          ],
                        ),
                       )
                    : SizedBox.shrink()),

                const Divider(color: Colors.black26, height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text("Thanh toán", style: kFontSubTitle(fontSize: 18)),
                      const Spacer(),
                      Text("Chọn phương thức",
                          style: kFontTitle(fontSize: 18)),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            controller.togglePaymentExpanded();
                          },
                          icon: Icon(controller.isPaymentExpanded.value
                              ? Icons.expand_less
                              : Icons.expand_more),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => controller.isPaymentExpanded.value
                    ? Column(
                        children: [
                          ListTile(
                            title: Text("Thanh toán tiền mặt",
                                style: kFontSubTitle(fontSize: 18)),
                            leading: Radio<String>(
                              value: '1',
                              groupValue: controller.paymentType.value,
                              onChanged: (String? value) {
                                if (value != null)
                                  controller.changePaymentType(value);
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Thanh toán bằng VNPay",
                              style: kFontSubTitle(fontSize: 18),
                            ),
                            leading: Radio<String>(
                              value: '2',
                              groupValue: controller.paymentType.value,
                              onChanged: (String? value) {
                                if (value != null)
                                  controller.changePaymentType(value);
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox()),
                const Divider(color: Colors.black26, height: 1),

                // Tổng tiên
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              Text("Tổng tiền", style: kFontSubTitle(fontSize: 18))),
                      const Spacer(),
                      Expanded(
                        child: Obx(() => Text(
                            "${NumberFormat("#,##0", "vi_VN").format(controller.calculateTotalPrice())} VNĐ",
                            style: kFontTitle(fontSize: 18))),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 67,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.placeOrder();
                    },
                    child: Text("Đặt hàng", style: kFontTextButton),
                    style: buttonPrimary,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

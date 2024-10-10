import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/checkout.dart';
import 'package:shopping_app/view/my_cart/widgets/order_accept.dart';
import 'package:shopping_app/view/my_cart/widgets/vnpay_payment_screen.dart';
import '../../models/product_detail.dart';
import '../services/api_checkout.dart';

class MyCartController extends GetxController {
  RxList<ProductDetail> cartItems = <ProductDetail>[].obs;

  final paymentType = '1'.obs;
  RxBool isPaymentExpanded = false.obs;
  RxBool isAddressExpanded = false.obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ApiCheckout apiCheckout = ApiCheckout(); // Tạo instance của ApiCheckout

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }



  void changePaymentType(String value) {
    paymentType.value = value;
  }


  void togglePaymentExpanded(){
    isPaymentExpanded.value = !isPaymentExpanded.value;
  }

  void toggleAddressExpanded(){
    isAddressExpanded.value = !isAddressExpanded.value;
  }



  // Tải data từ local
  void loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

    cartItems.value = cartItemsString
        .map((item) => ProductDetail.productDetailFromJson(jsonDecode(item)))
        .toList();
  }

  // Xóa sản phẩm khỏi giỏ hàng
  void removeFromCart(int index) async {
    cartItems.removeAt(index);
    _saveCartItems();
  }

  // Tính tổng giá tiền của giỏ hàng
  double calculateTotalPrice() {
    return cartItems.fold(0.0, (sum, item) {
      return sum + (item.price * item.quantity);
    });
  }

  // Cập nhật số lượng sản phẩm
  void updateQuantity(int index, int quantity) async {
    cartItems[index] = cartItems[index].copyWithQuantity(quantity: quantity);
    _saveCartItems();
  }


  // Lưu các cartItems vào SharedPreferences
  void _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItemsString = cartItems.map((item) => jsonEncode(item.toMap())).toList();
    prefs.setStringList('cart_items', cartItemsString);
  }


  // Hàm validate và gọi API
  Future<void> placeOrder() async {
    try{
      String address = addressController.text.trim();
      String phone = phoneController.text; // Thay thế bằng số điện thoại của bạn
      List<OrderItem> orderItems = cartItems.map((item) {
        return OrderItem(productId: int.parse(item.id.toString()) ?? 0, quantity: item.quantity);
      }).toList();

      if (address.isEmpty) {
        Get.snackbar('Lỗi', 'Địa chỉ không được để trống');
        return;
      }
      if (phone.isEmpty) {
        Get.snackbar('Lỗi', 'Số điện thoại không được để trống');
        return;
      }

      // Tính tổng giá
      int totalAmount = calculateTotalPrice().toInt();

      // Tạo đối tượng Order
      Order order = Order(
        totalAmount: totalAmount,
        address: address,
        phone: phone,
        listOrderItem: orderItems,
      );

      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');

      // Gọi API để đặt hàng
      final response = await apiCheckout.checkout(order, jwtToken!);

      print("phan hoi: ${response.statusCode}");

      if (response.statusCode == 200) {
        if (paymentType.value == '2') { // Thanh toán bằng VNPay
          String paymentUrl = response.body['data']['url'];
          print('phan hoi tu my_cart: ${response.body['data']['url']}');
          Get.to(() => VNPayPaymentScreen(), arguments: paymentUrl);
        } else {
          // Xử lý nếu đặt hàng thành công với thanh toán tiền mặt
          Get.snackbar('Thành công', 'Đặt hàng thành công!', colorText: Colors.white, backgroundColor: Colors.green);
          Get.to(() => OrderAcceptView());
        }
      } else {
        Get.snackbar('Lỗi', 'Đặt hàng thất bại: ${response.body['message']}');
      }
    }catch(e){
      print("catch : $e");
    }

  }

}





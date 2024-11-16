import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/order_history.dart';

import '../services/api_order_history.dart';

class OrderHistoryController extends GetxController{
  final ApiOrderHistory _apiOrderHistory = ApiOrderHistory();

  Rx<OrderHistory?> orderHistory = Rx<OrderHistory?>(null);
  RxBool isOrderHistoryLoading  = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrderHistory();

  }
  Future<void> getOrderHistory() async{
    try {
      isOrderHistoryLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiOrderHistory.getOrderHistory(jwtToken!);
       print(result.statusCode);
      if (result.statusCode == 200) {
        orderHistory.value = OrderHistory.orderHistoryFromJson(result.body['data']['data']);
      }
      else {
        Get.snackbar('Lỗi', 'Không thể lấy lịch sử đơn hàng',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      // print(productList.length);
      isOrderHistoryLoading(false);
    }

  }
}
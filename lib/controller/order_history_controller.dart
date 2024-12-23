import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/order_history.dart';
import 'package:shopping_app/services/api_order_history.dart';

class OrderHistoryController extends GetxController {
  final ApiOrderHistory _apiOrderHistory = ApiOrderHistory();

  RxList<OrderHistory> orderHistory = <OrderHistory>[].obs;
  RxBool isProductLoading = false.obs;
  


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    try {
      isProductLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiOrderHistory.getOrderHistory(jwtToken!);
      orderHistory.assignAll(orderHistoryFromJson(result.body));
      // print('order length:${orderHistory.length}');
    }catch(e){
      // print("lỗi máy chủ");
    }
    finally {
      isProductLoading(false);
    }
  }

  
}

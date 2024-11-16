import 'package:get/get.dart';
import 'package:shopping_app/controller/order_history_controller.dart';
import 'package:shopping_app/services/api_order_history.dart';

class OrderHistoryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
    Get.lazyPut<ApiOrderHistory>(() => ApiOrderHistory());
  }
}
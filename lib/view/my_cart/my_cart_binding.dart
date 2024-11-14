import 'package:get/get.dart';
import 'package:shopping_app/controller/my_cart_controller.dart';
import 'package:shopping_app/controller/product_detail_controller.dart';
import 'package:shopping_app/services/api_checkout.dart';

class MyCartBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<MyCartController>(() => MyCartController());
    Get.lazyPut<ApiCheckout>(() => ApiCheckout());
  }
}
import 'package:get/get.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/services/api_find_product_by_category.dart';
import 'package:shopping_app/services/api_product.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ApiProduct>(() => ApiProduct());
    Get.lazyPut<ApiFindProductByCategory>(() => ApiFindProductByCategory());
  }
}
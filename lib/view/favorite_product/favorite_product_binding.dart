import 'package:get/get.dart';
import 'package:shopping_app/controller/favorite_product_controller.dart';
import 'package:shopping_app/services/api_favorite_product.dart';

class FavoriteProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FavoriteProductController>(() => FavoriteProductController());
    Get.lazyPut<ApiFavoriteProduct>(() => ApiFavoriteProduct());
  }
}
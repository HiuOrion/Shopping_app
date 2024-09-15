import 'package:get/get.dart';
import 'package:shopping_app/controller/product_detail_controller.dart';
import 'package:shopping_app/services/api_favorite_product.dart';
import 'package:shopping_app/services/api_product_detail.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
  Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  Get.lazyPut<ApiProductDetail>(() => ApiProductDetail());
  Get.lazyPut<ApiFavoriteProduct>(() => ApiFavoriteProduct());
  }
}
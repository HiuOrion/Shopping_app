import 'package:get/get.dart';
import 'package:shopping_app/controller/favorite_product_controller.dart';
import 'package:shopping_app/view/chat/chat_binding.dart';
import 'package:shopping_app/view/favorite_product/favorite_product_binding.dart';
import 'package:shopping_app/view/my_cart/my_cart_binding.dart';

import '../view/account/account_binding.dart';
import '../view/home/home_binding.dart';
import '../view/product/product_binding.dart';

class DashboardController extends GetxController{
  var tabIndex = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Load dependencies cho Home và Product từ đầu
    HomeBinding().dependencies();
    ProductBinding().dependencies();
    AccountBinding().dependencies();
    FavoriteProductBinding().dependencies();
    MyCartBinding().dependencies();
    ChatBinding().dependencies();
  }

  void updateIndex(int index){
    tabIndex.value = index;
    if (index == 2) { // Giả sử index 2 là tab Favorite
      if (!Get.isRegistered<FavoriteProductController>()) {
      }
      Get.find<FavoriteProductController>().getListFavoriteProduct();
    }
  }
}
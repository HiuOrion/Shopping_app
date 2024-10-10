import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/favorite_product.dart';
import 'package:shopping_app/services/api_favorite_product.dart';

class FavoriteProductController extends GetxController{
  final ApiFavoriteProduct _apiFavoriteProduct = ApiFavoriteProduct();

  RxList<FavoriteProduct> listFavoriteProduct = <FavoriteProduct>[].obs;
  RxBool isFavoriteProductLoading  = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListFavoriteProduct();

  }



  Future<void> getListFavoriteProduct() async {
    try{
      isFavoriteProductLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiFavoriteProduct.getListFavoriteProduct(jwtToken!);
      listFavoriteProduct.assignAll(FavoriteProductFromJson(result.body));
      // print("list favorite product: ${result.body}" );

    }catch(e){
      Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }finally{
      isFavoriteProductLoading(false);
    }
  }
}
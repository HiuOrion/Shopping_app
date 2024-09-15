import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/product_detail.dart';
import 'package:shopping_app/services/api_favorite_product.dart';
import 'package:shopping_app/services/api_product_detail.dart';

class ProductDetailController extends GetxController{
  RxBool isFavorite = false.obs;
  final ApiFavoriteProduct _apiFavoriteProduct = ApiFavoriteProduct();
  final ApiProductDetail _apiProductDetail = ApiProductDetail();
  Rx<ProductDetail?> productDetail = Rx<ProductDetail?>(null);
  RxBool isProductDetailLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print(categoryId);
    var productId = Get.arguments;
    getProductDetail(productId);
  }

  Future<void> getProductDetail(String productId) async{
    try {
      isProductDetailLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiProductDetail.getProductDetail(
          jwtToken!, productId);
      // print(result.body);
      if (result.statusCode == 200) {
        productDetail.value = ProductDetail.productDetailFromJson(result.body['data']);
        isFavorite.value = productDetail.value!.favorite;
        print('product id: ${productDetail.value!.id}');

      }
     else {
        Get.snackbar('Lỗi', 'Không thể lấy chi tiết sản phẩm',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      // print(productList.length);
      isProductDetailLoading(false);
    }

  }

  Future<void> toggleFavoriteProduct() async{
     try{
       isFavorite.value = !isFavorite.value;
       final prefs = await SharedPreferences.getInstance();
       var jwtToken = prefs.getString('jwt_token');
       var result = await _apiFavoriteProduct.updateFavoriteProduct(jwtToken!, productDetail.value!.id);
       final messageFavorite = result.body['message'];
       print(result.body);

       if(result.statusCode == 200){
         Get.snackbar('Thành công', messageFavorite,
             snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
       }
     }catch(e){
       isFavorite.value = !isFavorite.value;
       Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
     }
}
}
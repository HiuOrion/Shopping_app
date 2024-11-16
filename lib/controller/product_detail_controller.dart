import 'dart:convert';

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
  RxInt quantityFinal =  1.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int productId = Get.arguments;
    getProductDetail(productId);
  }

  //Tăng số lượng muốn mua
  void increaseQuantity(){
    if(quantityFinal.value < productDetail.value!.quantity){
      quantityFinal.value++;
    }
  }

  //Giảm số lượng muốn mua
  void decreaseQuantity(){
    if(quantityFinal > 1){
      quantityFinal.value--;
    }
  }

  //Xử lý số lượng muốn mua khi nhập từ bàn phím
  void updateQuantity(String value){
    int? input = int.tryParse(value);
    if(input != null && input >0 ){
      quantityFinal.value = (input > productDetail.value!.quantity) ? productDetail.value!.quantity : input;
    }
  }

  void addToCart() async {
    if (productDetail.value!.quantity == 0) {
      Get.snackbar(
        'Lỗi',
        'Trong kho đã hết sản phẩm',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (quantityFinal.value == 0) {
      Get.snackbar(
        'Lỗi',
        'Số lượng sản phẩm phải lớn hơn 0',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

      // Lấy số lượng sản phẩm trong giỏ hàng để tính tổng số lượng
      int totalQuantityInCart = 0;
      for (var item in cartItemsString) {
        var parsedItem = Map<String, dynamic>.from(jsonDecode(item));
        if (parsedItem['id'] == productDetail.value!.id) {
          totalQuantityInCart += (parsedItem['quantity'] as num?)?.toInt() ?? 0;
        }
      }

      // Kiểm tra nếu tổng số lượng vượt quá số lượng tồn kho
      int availableStock = productDetail.value!.quantity;
      if (totalQuantityInCart + quantityFinal.value > availableStock) {
        Get.snackbar(
          'Lỗi',
          'Bạn đang thêm quá số lượng sản phẩm "${productDetail.value!.name}" hiện có trong kho.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 1)
        );
        return;
      }

      // Tạo đối tượng cartItem
      final cartItem = {
        "id": productDetail.value!.id,
        "name": productDetail.value!.name,
        "price": productDetail.value!.price,
        "quantity": quantityFinal.value,
        "image": productDetail.value!.image,
        "weight": productDetail.value!.weight,
      };

      List<Map<String, dynamic>> cartItems = [];
      for (var item in cartItemsString) {
        try {
          var parsedItem = Map<String, dynamic>.from(jsonDecode(item));
          parsedItem['id'] = parsedItem['id'] ?? 0;
          parsedItem['price'] = parsedItem['price'] ?? 0;
          parsedItem['quantity'] = parsedItem['quantity'] ?? 0;
          cartItems.add(parsedItem);
        } catch (e) {
          print("Lỗi khi phân tích cú pháp JSON: $e");
        }
      }

      int index = cartItems.indexWhere((item) => item['id'] == productDetail.value!.id);

      if (index != -1) {
        cartItems[index]['quantity'] = (cartItems[index]['quantity'] as int) + quantityFinal.value;
      } else {
        cartItems.add(cartItem);
      }

      List<String> updatedCartItemsString = cartItems.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList('cart_items', updatedCartItemsString);

      // Lưu số lượng vào SharedPreferences với key riêng biệt
      await prefs.setInt('product_quantity_${productDetail.value!.id}', productDetail.value!.quantity);

      Get.snackbar('Thành công', 'Sản phẩm đã được thêm vào giỏ hàng',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white, duration: const Duration(seconds: 1));
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể thêm sản phẩm vào giỏ hàng',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white, duration: const Duration(seconds: 1));
      print(e);
    }
  }


  //Lấy ra sản phẩm từ api
  Future<void> getProductDetail(int productId) async{
    try {
      isProductDetailLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiProductDetail.getProductDetail(
          jwtToken!, productId);
      
      if (result.statusCode == 200) {
        productDetail.value = ProductDetail.productDetailFromJson(result.body['data']);
        isFavorite.value = productDetail.value!.favorite;


      }
     else {
        Get.snackbar('Lỗi', 'Không thể lấy chi tiết sản phẩm',
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
      isProductDetailLoading(false);
    }

  }

  //Thay đổi trạng thái yêu thích của sản phẩm
  Future<void> toggleFavoriteProduct() async{
     try{
       isFavorite.value = !isFavorite.value;
       final prefs = await SharedPreferences.getInstance();
       var jwtToken = prefs.getString('jwt_token');
       var result = await _apiFavoriteProduct.updateFavoriteProduct(jwtToken!, productDetail.value!.id);
       final messageFavorite = result.body['message'];
       // print(result.body);

       if(result.statusCode == 200){
         Get.snackbar('Thành công', messageFavorite,
             snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
       }
     }catch(e){
       isFavorite.value = !isFavorite.value;
       Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
           snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
     }
}
}
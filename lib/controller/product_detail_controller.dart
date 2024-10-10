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
  RxInt quantityFinal = 1.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print(categoryId);
    var productId = Get.arguments;
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

    //Nếu số lượng sản phẩm trong kho bằng 0 thì thì không thể thêm
    if (productDetail.value!.quantity == 0) {
      // Hiển thị thông báo lỗi khi số lượng trong kho bằng 0
      Get.snackbar(
        'Lỗi',
        'Trong kho đã hết sản phẩm',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Kiểm tra nếu số lượng được chọn bằng 0
    if (quantityFinal.value == 0) {
      // Hiển thị thông báo lỗi khi số lượng bằng 0
      Get.snackbar(
        'Lỗi',
        'Số lượng sản phẩm phải lớn hơn 0',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Lỗi: Số lượng phải lớn hơn 0");
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

      // Tạo đối tượng Map từ productDetail và số lượng
      final cartItem = {
        "id": productDetail.value!.id,
        "name": productDetail.value!.name,
        "price": productDetail.value!.price,
        "quantity": quantityFinal.value, // số lượng được chọn
        "image": productDetail.value!.image,
        "weight" : productDetail.value!.weight
      };

      // Chuyển các cartItems từ JSON string sang Map để thao tác, thêm kiểm tra lỗi
      List<Map<String, dynamic>> cartItems = [];
      for (var item in cartItemsString) {
        try {
          cartItems.add(Map<String, dynamic>.from(jsonDecode(item)));
        } catch (e) {
          print("Lỗi khi phân tích cú pháp JSON: $e");
        }
      }

      // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
      int index = cartItems.indexWhere((item) => item['id'] == productDetail.value!.id);

      if (index != -1) {
        // Nếu sản phẩm đã có, cập nhật số lượng
        cartItems[index]['quantity'] = cartItems[index]['quantity'] + quantityFinal.value;
      } else {
        // Nếu sản phẩm chưa có, thêm sản phẩm mới vào giỏ hàng
        cartItems.add(cartItem);
      }

      // Chuyển đổi lại các cartItems thành JSON string để lưu vào SharedPreferences
      List<String> updatedCartItemsString = cartItems.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList('cart_items', updatedCartItemsString);
      // print(prefs.getStringList('cart_items'));


      // Hiển thị thông báo thành công
      Get.snackbar('Thành công', 'Sản phẩm đã được thêm vào giỏ hàng',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể thêm sản phẩm vào giỏ hàng',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      print(e);
    }
  }




  //Lấy ra sản phẩm từ api
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
        // print('product id: ${productDetail.value!.id}');

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
             snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
       }
     }catch(e){
       isFavorite.value = !isFavorite.value;
       Get.snackbar('Lỗi', 'Không thể kết nối đến máy chủ',
           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
     }
}
}
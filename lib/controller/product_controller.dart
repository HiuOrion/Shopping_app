import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/services/api_find_product_by_category.dart';
import 'package:shopping_app/services/api_product.dart';

import '../models/category.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  final ApiProduct _apiProduct = ApiProduct();
  final ApiFindProductByCategory  _apiFindProductByCategory = ApiFindProductByCategory();

  RxList<Product> productList = <Product>[].obs;
  RxBool isProductLoading = false.obs;
  RxString nameCategory = "".obs;
   int categoryId = 0;
  RxList<Product> productListFindCategory = <Product>[].obs;
  //
  // Future<void> addToCart(Product product, int quantity) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //
  //     List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];
  //     List<Map<String, dynamic>> cartItems = cartItemsString
  //         .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
  //         .toList();
  //
  //     // Tìm sản phẩm trong giỏ hàng theo ID
  //     int index = cartItems.indexWhere((item) => item['id'] == product.id);
  //
  //     if (index != -1) {
  //       // Sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng lên 1
  //       cartItems[index]['quantity'] += 1;
  //     } else {
  //       // Thêm sản phẩm mới vào giỏ hàng với số lượng mặc định là 1
  //       cartItems.add({
  //         'id': product.id,
  //         'name': product.name,
  //         'price': product.price,
  //         'quantity': quantity, // Mặc định thêm vào là 1
  //         'image': product.image,
  //         'weight': product.weight,
  //       });
  //     }
  //
  //     // Lưu lại danh sách sản phẩm trong giỏ hàng vào SharedPreferences
  //     List<String> updatedCartItemsString =
  //     cartItems.map((item) => jsonEncode(item)).toList();
  //     await prefs.setStringList('cart_items', updatedCartItemsString);
  //
  //     // Lưu số lượng sản phẩm vào SharedPreferences với key riêng biệt
  //     await prefs.setInt('product_quantity_${product.id}',
  //         cartItems[index != -1 ? index : cartItems.length - 1]['quantity']);
  //
  //     Get.snackbar(
  //       'Thành công',
  //       'Sản phẩm "${product.name}" đã được thêm vào giỏ hàng.',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Lỗi',
  //       'Không thể thêm sản phẩm vào giỏ hàng.',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     print('Error adding product to cart: $e');
  //   }
  // }
  //

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //Nhận categoryId từ arguments
    final Category category = Get.arguments;
    nameCategory.value = category.name; // Đặt tên của category vào nameCategory
    categoryId = category.id;
    fetchProduct(categoryId);
  }

  Future<void> fetchProduct(int categoryId) async {
    try {
      isProductLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiProduct.getProduct(jwtToken!, categoryId);
      productList.assignAll(productFromJson(result.body));
    } finally {
      isProductLoading(false);
    }
  }

  void findProductByCategory(String text) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');

      final result = await _apiFindProductByCategory.findProductByCategory(jwtToken!, categoryId, text);
      productListFindCategory.assignAll(productFromJson(result.body));

    } catch (e) {
      Get.snackbar('Lỗi tìm kiếm ', e.toString());
    }
  }
}

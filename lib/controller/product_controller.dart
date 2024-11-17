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

  void addToCart(Product product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

      // Lấy danh sách sản phẩm hiện có trong giỏ hàng
      List<Map<String, dynamic>> cartItems = cartItemsString
          .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
          .toList();

      // Tìm xem sản phẩm đã có trong giỏ hàng chưa
      int index = cartItems.indexWhere((item) => item['id'] == product.id);

      if (index != -1) {
        // Sản phẩm đã có trong giỏ, cập nhật số lượng
        cartItems[index]['quantity'] += 1;

        // Kiểm tra tồn kho
        if (cartItems[index]['quantity'] > product.quantity) {
          Get.snackbar(
            'Lỗi',
            'Không đủ sản phẩm "${product.name}" trong kho.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
      } else {
        // Thêm sản phẩm mới vào giỏ hàng
        cartItems.add({
          "id": product.id,
          "name": product.name,
          "price": product.price,
          "quantity": 1, // Mặc định thêm 1 sản phẩm
          "image": product.image,
          "weight": product.weight,
        });
      }

      // Lưu danh sách giỏ hàng mới vào SharedPreferences
      List<String> updatedCartItemsString = cartItems.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList('cart_items', updatedCartItemsString);

      Get.snackbar(
        'Thành công',
        'Sản phẩm "${product.name}" đã được thêm vào giỏ hàng.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
    } catch (e) {
      Get.snackbar(
        'Lỗi',
        'Không thể thêm sản phẩm vào giỏ hàng.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(e);
    }
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

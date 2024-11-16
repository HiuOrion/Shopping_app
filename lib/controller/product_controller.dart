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

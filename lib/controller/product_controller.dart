import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/services/api_product.dart';

import '../models/product.dart';

class ProductController extends GetxController{

  final ApiProduct _apiProduct = ApiProduct();

  RxList<Product> productList = <Product>[].obs;
  RxBool isProductLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //Nhận categoryId từ arguments
    final String categoryId = Get.arguments;
    print(categoryId);
    fetchProduct(categoryId);
  }

  Future<void> fetchProduct(String categoryId) async{
    try{
      isProductLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiProduct.getProduct(jwtToken!, categoryId);
      // print(result.body);
      productList.assignAll(productFromJson(result.body));

    }finally{
      // print(productList.length);
      isProductLoading(false);
    }
  }

  void findProductByCategory(String categoryId) async{
    try{
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
    }catch(e){

    }
  }
}
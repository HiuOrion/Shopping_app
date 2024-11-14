import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/services/api_top_product.dart';

import '../models/top_product.dart';

class TopProductController extends GetxController{

  final ApiTopProduct apiTopProduct = ApiTopProduct();

  RxList<TopProduct> listTopProduct = <TopProduct>[].obs;

  RxBool isTopProductLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTopProduct();

  }

  Future<void> fetchTopProduct() async {
    try {
      isTopProductLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');

      var result = await apiTopProduct.getTopProduct(jwtToken!);

      listTopProduct.assignAll(topProductFromJson(result.body));
    } catch (e) {
      print("Lỗi lấy dữ liệu top product; $e");
    } finally {
      isTopProductLoading(false);
    }
  }


}
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/category.dart';
import 'package:shopping_app/services/api_category.dart';

class HomeController extends GetxController {

  final ApiCategory _apiCategory = ApiCategory();

  var categoryList = <Category>[].obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
   try{
      isCategoryLoading(true);

      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await _apiCategory.getCategory(jwtToken!);
      // print(result.body);
      categoryList.assignAll(categoryFromJson(result.body));


   }finally{
     // print(categoryList.length);
     isCategoryLoading(false);
   }
  }
}

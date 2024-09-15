import 'package:get/get.dart';
import 'package:shopping_app/controller/home_controller.dart';
import 'package:shopping_app/services/api_category.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ApiCategory>(() => ApiCategory());
  }
}
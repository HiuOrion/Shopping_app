import 'package:get/get.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/services/api_logIn.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(() => LogInController());
    Get.lazyPut<ApiLogIn>(() => ApiLogIn());
  }
}
import 'package:get/get.dart';
import 'package:shopping_app/controller/forgot_pass_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController() );
  }
}
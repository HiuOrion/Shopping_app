import 'package:get/get.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/services/api_signup.dart';

//Sử dụng Binding,
//GetX sẽ tự động khởi tạo các controller khi màn hình (screen) tương ứng được gọi,
//và giải phóng chúng khi không cần thiết nữa. Điều này giúp quản lý bộ nhớ hiệu quả hơn.

class SignUpBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpController>(() => SignUpController()); //lazyPut giúp tiết kiệm tài nguyên
    Get.lazyPut<ApiSignUp>(() => ApiSignUp());
  }

}
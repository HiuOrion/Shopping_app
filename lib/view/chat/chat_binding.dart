import 'package:get/get.dart';
import 'package:shopping_app/controller/chat_controller.dart';
import 'package:shopping_app/services/api_account.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ApiAccount>(() => ApiAccount());
    Get.lazyPut(()=>ChatController());
  }
}

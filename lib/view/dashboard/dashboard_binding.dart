import 'package:get/get.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
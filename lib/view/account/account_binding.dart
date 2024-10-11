import 'package:get/get.dart';
import 'package:shopping_app/controller/account_controller.dart';
import 'package:shopping_app/controller/address_controller.dart';
import 'package:shopping_app/controller/google_map_controller.dart';
import 'package:shopping_app/services/api_account.dart';

class AccountBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<ApiAccount>(() => ApiAccount());
    Get.lazyPut<AddressController>(() => AddressController());
    Get.lazyPut<GoogleMapAddressController>(() => GoogleMapAddressController());
  }
}
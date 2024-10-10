import 'package:get/get.dart';
import 'package:shopping_app/models/checkout.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiCheckout extends GetConnect {

  Future<Response> checkout(Order order, String token) async {
    final response = await post(
        "${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.checkout}",
        order.CheckoutToJson(),
        headers: {"Authorization": "Bearer $token"});
    return response;
  }
}

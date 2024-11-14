import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiTopProduct extends GetConnect {
  Future<Response> getTopProduct(String token) async {
    var response = await get(
        "${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.topProduct}",
        headers: {'Authorization': 'Bearer $token'});

    return response;
  }
}

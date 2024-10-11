import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiFindProductByCategory extends GetConnect {
  Future<Response> findProductByCategory(
      String token, String categoryId, String nameProduct) async {
    final response = await get(
        "${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.findProductByCategory(categoryId, nameProduct)}",
        headers: {"Authorization": "Bearer $token"});

    return response;
  }
}

import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiFavoriteProduct extends GetConnect {
  Future<Response> updateFavoriteProduct(String token, String productId) async {
    final response = await post(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.updateFavoriteProduct(productId)}',
        {},
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}

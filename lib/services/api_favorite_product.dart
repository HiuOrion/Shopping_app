import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiFavoriteProduct extends GetConnect {
  Future<Response> updateFavoriteProduct(String token, int productId) async {
    final response = await post(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.updateFavoriteProduct(productId)}',
        {},
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response> getListFavoriteProduct(String token) async {
    final response = await get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.favoriteProduct}',
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}

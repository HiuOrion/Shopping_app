import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiProductDetail extends GetConnect {

  Future<Response> getProductDetail(String token, String productId) async {
    var response = await get('${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.productDetail(productId)}',
        headers: {'Authorization' : 'Bearer $token'});

    return response;
  }
}
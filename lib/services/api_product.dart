import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiProduct extends GetConnect {

  Future<Response> getProduct(String token, int categoryId) async {

    var response = await get('${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.productByCategory(categoryId)}',
        headers: {'Authorization' : 'Bearer $token'});

    return response;
  }
}
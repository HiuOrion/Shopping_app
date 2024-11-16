import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiOrderHistory extends GetConnect {

  Future<Response> getOrderHistory(String token) async {
    var response = await get('${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.orderHistory}',
        headers: {'Authorization' : 'Bearer $token'});

    return response;
  }
}

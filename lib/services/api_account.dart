import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiAccount extends GetConnect {
  Future<Response> fetchAccount(String token) async {
    final response = await
        get('${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.account}',
        headers: {"Authorization" : "Bearer $token"});
    return response;
  }
  Future<Response> logout(String token) async {
    final response = await post(
      '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.logout}',
        {},
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}

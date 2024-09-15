import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiCategory extends GetConnect {

  Future<dynamic> getCategory(String token) async {

    final response = await get(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.category}',
        headers: {'Authorization' : 'Bearer $token'});

    return response;
  }
}
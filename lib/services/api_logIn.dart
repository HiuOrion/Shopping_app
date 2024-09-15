import 'package:get/get.dart';
import 'package:shopping_app/models/login.dart';
import 'package:shopping_app/services/api_endpoint.dart';


class ApiLogIn extends GetConnect {

  // Login API endpoint
  Future<dynamic> login(String email, String password) async {
    final loginData = LoginModel(email: email, password: password);


    final response = await post(
      '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.loginEmail}',
      loginData.toJson(),
    );
    return response;
  }
}
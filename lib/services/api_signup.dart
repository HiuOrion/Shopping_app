import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/models/sign_up.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiSignUp extends GetConnect {

  Future<Response> signUp(SignUpModel signUpData) async {
      final response = await post(
        '${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.registerEmail}',
        json.encode(signUpData.toJson()),

      );
    return response;
  }
}

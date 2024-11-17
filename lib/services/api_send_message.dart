import 'package:get/get.dart';
import 'package:shopping_app/services/api_endpoint.dart';

class ApiSendMessage extends GetConnect {

  Future<void> sendMessage(String message) async {
    try {
      final response = await get('${ApiEndPoint.baseUrl}${ApiEndPoint.authEndPoints.sendMessage(message)}');

      if (response.statusCode == 200) {
        print('Tin nhắn đã gửi thành công');
        print('Response: ${response.body}');
      } else {
        print('Lỗi khi gửi tin nhắn');
      }
    } catch (e) {
      print('Lỗi khi gọi API: $e');
    }
  }
}
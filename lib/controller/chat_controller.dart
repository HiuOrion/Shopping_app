import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/services/api_send_message.dart';

import '../models/account.dart';
import '../services/api_account.dart';

class ChatController extends GetxController {
  DatabaseReference? messagesRef; // Thay đổi thành nullable để khởi tạo sau
  final TextEditingController textController = TextEditingController();

  var account = Rxn<Account>();
  var isLoadingAccount = false.obs;
  final ApiAccount apiAccount = ApiAccount();
  final ApiSendMessage apiSendMessBackend = ApiSendMessage();

  @override
  void onInit() {
    super.onInit();
    fetchAccount();
  }

  Future<void> fetchAccount() async {
    try {
      isLoadingAccount(true);

      final prefs = await SharedPreferences.getInstance();
      var jwtToken = prefs.getString('jwt_token');
      var result = await apiAccount.fetchAccount(jwtToken!);
      if (result.statusCode == 200) {
        account.value = Account.accountFromJson(result.body['data']);

        // Cập nhật messagesRef với id người dùng
        if (account.value?.id != null) {
          messagesRef = FirebaseDatabase.instance.ref(
              '${account.value!.id}/chatId/messages');
        }
      }
    } catch (e) {
      Get.snackbar(
        'Lỗi',
        "Không thể lấy dữ liệu",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingAccount(false);
    }
  }

  void sendMessage() async {
    if (textController.text.trim().isEmpty || messagesRef == null) return;

    // String message = textController.text.trim();

    // Gửi tin nhắn cho Firebase
    try {
      await messagesRef!.push().set({
        'text': textController.text,
        'created_at': DateTime.now().toUtc().toIso8601String(),
        'user_send': account.value?.userName ?? 'User', // Sử dụng tên người dùng
      });
      textController.clear();
    } catch (error) {
      print('Error sending message to Firebase: $error');
      Get.snackbar(
        'Lỗi Firebase',
        'Không thể gửi tin nhắn đến Firebase: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    // // Gửi tin nhắn cho backend
    // try {
    //   final result = await apiSendMessBackend.sendMessage(message);
    //   textController.clear();
    // } catch (error) {
    //   print('Error sending message to backend: $error');
    //   Get.snackbar(
    //     'Lỗi',
    //     'Đã xảy ra lỗi khi gửi tin nhắn lên backend: $error',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }
  }

}

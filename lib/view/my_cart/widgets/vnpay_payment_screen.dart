import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/my_cart/widgets/error_cart_view.dart';
import 'package:shopping_app/view/my_cart/widgets/order_accept.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/my_cart_controller.dart';

class VNPayPaymentScreen extends StatefulWidget {
  const VNPayPaymentScreen({super.key});

  @override
  State<VNPayPaymentScreen> createState() => _VNPayPaymentScreenState();
}

class _VNPayPaymentScreenState extends State<VNPayPaymentScreen> {
  late final WebViewController controller;
  final String urlPayment = Get.arguments;// Nhận URL thanh toán từ arguments
  final MyCartController cartController = Get.find<MyCartController>(); // Lấy controller giỏ hàng

  @override
  void initState() {
    super.initState();

    // Khởi tạo WebViewController và load URL nhận được
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Bắt đầu tải trang: $url');
          },
          onPageFinished: (String url) {
            // Kiểm tra nếu URL chứa kết quả trả về
            if (url.contains("vnp_ResponseCode")) {
              _handleReturnUrl(url);
            }
          },
          onWebResourceError: (error) {
            print("Lỗi tải trang: $error");
          },
        ),
      )
      ..loadRequest(Uri.parse(urlPayment)); // Sử dụng URL thanh toán
  }


  // Hàm kiểm tra URL và xử lý kết quả thanh toán
  void _handleReturnUrl(String url) {
    // Ở đây bạn có thể kiểm tra xem URL trả về có thành công hay không.
    // Giả sử mã thành công là 200 hoặc chuỗi "success" xuất hiện trong URL.
    if (url.contains("vnp_ResponseCode=00")) { // Kiểm tra URL trả về có chứa mã 200 hay "success"
      // Điều hướng đến OrderAcceptView nếu thanh toán thành công
      Get.snackbar('Thành công', 'Thanh toán thành công!', colorText: Colors.white, backgroundColor: Colors.green);
      Get.to(() => OrderAcceptView());
      cartController.clearCart(); // Xóa giỏ hàng khi thanh toán thành công
    } else {
      Get.snackbar('Lỗi', 'Thanh toán thất bại', colorText: Colors.white, backgroundColor: Colors.red);
      Get.to(() => ErrorCartView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán bằng VNPay'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.reload(), // Nút refresh WebView
          ),
        ],
      ),
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}

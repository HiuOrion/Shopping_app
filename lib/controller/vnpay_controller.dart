// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// import 'dart:developer'; // For logging
//
// class VNPayController extends GetxController {
//   late final WebViewController webViewController;
//   var isLoading = true.obs;
//   final String paymentUrl = Get.arguments as String;
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializeWebView();
//   }
//
//   void initializeWebView() {
//     // Initializing WebView based on the platform
//     late final PlatformWebViewControllerCreationParams params;
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }
//
//     webViewController = WebViewController.fromPlatformCreationParams(params)
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             isLoading.value = progress < 100;
//           },
//           onPageStarted: (String url) {
//             log('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             isLoading.value = false;
//             log("Page finished loading: $url");
//
//             // Check if the URL is the return URL for VNPay payment
//             if (url.contains("/payments/vnpay_return")) {
//               Get.toNamed("/status-payment", arguments: url);
//             }
//           },
//           onWebResourceError: (WebResourceError error) {
//             log('Page resource error: ${error.description} (code: ${error.errorCode})');
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(paymentUrl));
//   }
// }

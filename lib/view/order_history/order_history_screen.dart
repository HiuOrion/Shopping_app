import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/controller/order_history_controller.dart';
import 'package:shopping_app/models/order_history.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/view/chat/chat_burble.dart';
import 'package:shopping_app/view/chat/chat_screen.dart';

import '../../styles/app_colors.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final OrderHistoryController controller = Get.find<OrderHistoryController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<OrderHistory> filterOrdersByStatus(String status) {
    return controller.orderHistory
        .where((order) => order.orderStatus == status)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Lịch sử đơn hàng'),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền
                shape: BoxShape.circle, // Hình dạng tròn
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Màu bóng mờ
                    spreadRadius: 1, // Độ lan của bóng
                    blurRadius: 8, // Độ mờ của bóng
                    offset: const Offset(0, 3), // Độ lệch bóng
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.chat);
                },
                icon: const Icon(Icons.chat_bubble_outline),
                color: Colors.black, // Màu icon
              ),
            )
          ],
          bottom: const TabBar(
            labelColor: AppColors.primary,
            indicatorColor: AppColors.primary,
            isScrollable: true,
            dividerColor: Colors.grey,
            tabs: [
              Tab(text: 'Chờ giao hàng'),
              Tab(text: 'Đang giao hàng'),
              Tab(text: 'Đã giao'),
            ],
          ),
        ),
        body: Obx(() {
          // Use Obx to rebuild the widget when the orderHistory changes
          if (controller.orderHistory.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return TabBarView(
            children: [
              // Tab for "Lấy hàng" (processing orders)
              OrderList(
                listOrderHistory: filterOrdersByStatus('processing'),
              ),
              // Tab for "Chờ giao hàng" (shipped orders)
              OrderList(
                listOrderHistory: filterOrdersByStatus('shipped'),
              ),
              // Tab for "Đã giao" (delivered orders)
              OrderList(
                listOrderHistory: filterOrdersByStatus('delivered'),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<OrderHistory> listOrderHistory;

  const OrderList({super.key, required this.listOrderHistory});

  String orderStatus(String orderStatus) {
    switch (orderStatus) {
      case 'processing':
        return 'Chờ giao hàng';
      case 'shipped':
        return 'Đang giao hàng';
      case 'delivered':
        return 'Giao hàng thành công';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return ListView.builder(
      itemCount: listOrderHistory.length, // Replace with dynamic count
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {

        final order = listOrderHistory[index];

        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: media.width * 0.3,
                      height: media.height * 0.1,
                      child: CachedNetworkImage(
                        imageUrl: order.orderItems[0].product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderItems[0].product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text('Số lượng: ${order.orderItems[0].quantity}'),
                          const SizedBox(height: 5),
                          Text(
                            "${NumberFormat("#,##0", "vi_VN").format(order.orderItems[0].product.price)} VNĐ",
                            // '${order.orderItems[0].product.price.toString()}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      orderStatus(order.orderStatus),
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

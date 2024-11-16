import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/custom_appbar.dart';
import 'package:shopping_app/controller/order_history_controller.dart';
import 'package:shopping_app/models/order_history.dart';

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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lịch sử đơn hàng'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
          ],
          bottom: TabBar(
            isScrollable: true,
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
    return ListView.builder(
      itemCount: listOrderHistory.length, // Replace with dynamic count
      itemBuilder: (context, index) {
        final order = listOrderHistory[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      order.orderItems[0].product.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderItems[0].product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Số lượng: ${order.orderItems[0].quantity}'),
                          SizedBox(height: 5),
                          Text(
                            '${order.orderItems[0].product.price.toString()}',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      orderStatus(order.orderStatus),
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Trả hàng/Hoàn tiền'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Đánh giá'),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/custom_appbar.dart';
import 'package:shopping_app/controller/order_history_controller.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final OrderHistoryController controller =
  Get.find<OrderHistoryController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(isShowLeading: true, isShowCart: false)
    );
  }
}

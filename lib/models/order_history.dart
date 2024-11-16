import 'package:shopping_app/models/product.dart';

List<OrderHistory> orderHistoryFromJson(dynamic value) {
  return List<OrderHistory>.from(
      value['data']['data'].map((orderHistory) => OrderHistory.fromJson(orderHistory)));
}
class OrderHistory {
  int id;
  int userId;
  int totalAmount;
  String paymentStatus;
  String orderStatus;
  String transactionId;
  int phone;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderItem> orderItems;

  OrderHistory({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.paymentStatus,
    required this.orderStatus,
    required this.transactionId,
    required this.phone,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.orderItems,
  });


  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        id: json["id"],
        userId: json["user_id"],
        totalAmount: json["total_amount"],
        paymentStatus: json["payment_status"],
        orderStatus: json["order_status"],
        transactionId: json["transaction_id"],
        phone: json["phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

}

class OrderItem {
  int id;
  int orderId;
  int productId;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );
}

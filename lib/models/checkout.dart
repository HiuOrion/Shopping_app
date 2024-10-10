class OrderItem {
  final int productId;
  final int quantity;

  OrderItem({required this.productId, required this.quantity});

  // Chuyển từ JSON sang OrderItem
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }

  // Chuyển từ OrderItem sang JSON
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
    };
  }
}

class Order {
  final int totalAmount;
  final String address;
  final String phone;
  final List<OrderItem> listOrderItem;

  Order({
    required this.totalAmount,
    required this.address,
    required this.phone,
    required this.listOrderItem,
  });

  // Chuyển từ JSON sang Order
  factory Order.CheckoutFromJson(Map<String, dynamic> json) {
    var list = json['list_order_item'] as List;
    List<OrderItem> orderItemList =
    list.map((i) => OrderItem.fromJson(i)).toList();

    return Order(
      totalAmount: json['total_amount'],
      address: json['address'],
      phone: json['phone'],
      listOrderItem: orderItemList,
    );
  }

  // Chuyển từ Order sang JSON
  Map<String, dynamic> CheckoutToJson() {
    return {
      'total_amount': totalAmount,
      'address': address,
      'phone': phone,
      'list_order_item': listOrderItem.map((item) => item.toJson()).toList(),
    };
  }
}

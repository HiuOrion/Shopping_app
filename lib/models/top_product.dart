List<TopProduct> topProductFromJson(dynamic value) {
  return List<TopProduct>.from(
      value['data']['data'].map((topProduct) => TopProduct.fromJson(topProduct)));
}

class TopProduct {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final String weight;
  final String image;
  final String totalQuantity;

  TopProduct({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.weight,
    required this.image,
    required this.totalQuantity,
  });

  factory TopProduct.fromJson(Map<String, dynamic> json) {
    return TopProduct(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      weight: json['weight'],
      image: json['image'],
      totalQuantity: json['total_quantity'],
    );
  }
}

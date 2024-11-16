List<Product> productFromJson(dynamic value) {
  return List<Product>.from(
      value['data']['data'].map((product) => Product.fromJson(product)));
}

class Product {
  final int id;
  final int categoryId;
  final String description;
  final String name;
  final String image;
  final int quantity;
  final int price;
  final String weight;

  Product({
    required this.id,
    required this.categoryId,
    required this.description,
    required this.name,
    required this.image,
    required this.quantity,
    required this.weight,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ,
      categoryId: json['category_id'] ,
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'],
      weight: json['weight'] ?? '',
      price: json["price"],
    );
  }
}

List<Product> productFromJson(dynamic value) {
  return List<Product>.from(
      value['data']['data'].map((product) => Product.productFromJson(product)));
}

class Product {
  final String id;
  final String categoryId;
  final String description;
  final String name;
  final String image;
  final String quantity;
  final String price;
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

  factory Product.productFromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString()  ,
      categoryId: json['category_id'].toString()  ,
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'].toString() ,
      weight: json['weight'] ?? '',
      price: json["price"].toString(),
    );
  }
}

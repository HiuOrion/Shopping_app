ProductDetail productDetailFromJson(dynamic value) {
  return ProductDetail.productDetailFromJson(value['data']);
}

class ProductDetail {
  final String id;
  final String categoryId;
  final String description;
  final String name;
  final String image;
  final int quantity;
  final int price;
  final String weight;
  final bool favorite;

  ProductDetail({
    required this.id,
    required this.categoryId,
    required this.description,
    required this.name,
    required this.image,
    required this.quantity,
    required this.weight,
    required this.price,
    required this.favorite
  });

  factory ProductDetail.productDetailFromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'].toString(),
      categoryId: json['category_id'].toString()  ,
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'] ,
      weight: json['weight'] ?? '',
      price: json["price"],
      favorite: json['favourite'] ?? false
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'description': description,
      'name': name,
      'image': image,
      'quantity': quantity,
      'weight': weight,
      'price': price,
      'favourite': favorite
    };
  }

  ProductDetail copyWithQuantity({int? quantity}) {
    return ProductDetail(
      id: this.id,
      categoryId: this.categoryId,
      description: this.description,
      name: this.name,
      image: this.image,
      quantity: quantity ?? this.quantity,
      weight: this.weight,
      price: this.price,
      favorite: this.favorite,
    );
  }

}

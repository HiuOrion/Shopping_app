ProductDetail productDetailFromJson(dynamic value) {
  return ProductDetail.productDetailFromJson(value['data']);
}

class ProductDetail {
  final String id;
  final String categoryId;
  final String description;
  final String name;
  final String image;
  final String quantity;
  final String price;
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
      id: json['id'].toString()  ,
      categoryId: json['category_id'].toString()  ,
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'].toString() ,
      weight: json['weight'] ?? '',
      price: json["price"].toString(),
      favorite: json['favourite']
    );
  }
}

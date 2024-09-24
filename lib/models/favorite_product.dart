List<FavoriteProduct> FavoriteProductFromJson(dynamic value) {
  return List<FavoriteProduct>.from(
    value['data']['data'].map(
      (favoriteProduct) => FavoriteProduct.favoriteProductFromJson(favoriteProduct),
    ),
  );
}

class FavoriteProduct {
  int id;
  int categoryId;
  String name;
  String description;
  int price;
  int quantity;
  String weight;
  String image;
  int userId;
  int productId;

  FavoriteProduct({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.weight,
    required this.image,
    required this.userId,
    required this.productId,
  });

  factory FavoriteProduct.favoriteProductFromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
        id: json['id'],
        categoryId: json['category_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        quantity: json['quantity'],
        weight: json['weight'],
        image: json['image'],
        userId: json['user_id'],
        productId: json['product_id']);
  }
}

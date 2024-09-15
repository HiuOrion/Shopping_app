List<Category> categoryFromJson(dynamic value) {
  return List<Category>.from(
      value.map((category) => Category.categoryFromJson(category))
  );
}
class Category {
  final String id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.categoryFromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'] ?? 'Unknown',
      image: json['image'] ?? '',
    );
  }
}

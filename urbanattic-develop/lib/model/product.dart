class Product {
  final String name;
  final String description;
  final List<String> images;
  final String id;
  final double price;

  Product(
      {required this.name,
      required this.description,
      required this.images,
      required this.id,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: json['image'],
      price: json['price'],
    );
  }
}

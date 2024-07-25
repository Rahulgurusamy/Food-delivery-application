class Food {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String category;
  final String ingredients;
  final String nutritionalInfo;
  bool isFavorite;
  int quantity;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.ingredients,
    required this.nutritionalInfo,
    this.isFavorite = false,
    this.quantity = 1,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imagePath: json['imagePath'],
      category: json['category'],
      ingredients: json['ingredients'],
      nutritionalInfo: json['nutritionalInfo'],
      isFavorite: json['isFavorite'] ?? false,
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'category': category,
      'ingredients': ingredients,
      'nutritionalInfo': nutritionalInfo,
      'isFavorite': isFavorite,
      'quantity': quantity,
    };
  }
}

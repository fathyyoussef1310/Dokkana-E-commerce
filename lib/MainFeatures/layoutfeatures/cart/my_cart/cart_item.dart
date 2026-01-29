class CartItem {
  final String id;
  final String title;
  final String imagePath;
  final String size;
  final String color;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.size,
    required this.color,
    required this.price,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? title,
    String? imagePath,
    String? size,
    String? color,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      size: size ?? this.size,
      color: color ?? this.color,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

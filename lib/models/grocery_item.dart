class GroceryItem {
  final int id;
  final String name;
  final double price;
  final String image;

  GroceryItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      id: json['id'],
      name: json['name'],
      price: _parsePrice(json['price']),
      image: json['image'],
    );
  }
 
  static double _parsePrice(dynamic price) {
    if (price is double) {
      return price;
    } else if (price is String) {
    
      return double.tryParse(price.replaceAll('LKR', '').trim()) ?? 0.0;
    } else {
      return 0.0;  
    }
  }
}

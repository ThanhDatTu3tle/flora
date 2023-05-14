class Flower {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  bool? favorite;

  Flower({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.favorite,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    return Flower(
      id: json['_id'] as String ?? '',
      name: json['name'] as String ?? '',
      image: json['image'] as String,
      // description: json['description'] as String,
      price: json['price'] as int,
      favorite: json['favorite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'favorite': favorite,
    };
  }
}

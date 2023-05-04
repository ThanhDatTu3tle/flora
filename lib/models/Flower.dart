class Flower {
  final String name, image;
  final List<String> description;
  final double price;

  Flower({
  required this.name,
  required this.description,
  required this.image,
  required this.price,
  });

  // Flower.fromJson(Map<String, dynamic> json, this.name, this.image, this.description, this.price) {
  //   name = json['name'];
  //   description = json['description'];
  //   image = json['image'];
  //   price = json['price'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> date = new Map<String, dynamic>();
  //   data['name'] = this.name;
  // }

}

List<Flower> hardFlowers = [
  Flower(
    image: "assets/images/daisy.png",
    name: "Daisy",
    description: [

    ],
    price: 250.000,
  ),
  Flower(
    image: "assets/images/HongTrang.png",
    name: "Hồng trắng",
    description: [

    ],
    price: 320.000,
  ),
  Flower(
    image: "assets/images/CucTrang.png",
    name: "Cúc trắng",
    description: [

    ],
    price: 150.000,
  )
];
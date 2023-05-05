class FlowerModel {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;

  FlowerModel({
    this.name,
    this.description,
    this.image,
    this.price,
  });

  FlowerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;

    return data;
  }
}

// List<Flower> hardFlowers = [
//   Flower(
//     image: "assets/images/daisy.png",
//     name: "Daisy",
//     description: [
//
//     ],
//     price: 250.000,
//   ),
//   Flower(
//     image: "assets/images/HongTrang.png",
//     name: "Hồng trắng",
//     description: [
//
//     ],
//     price: 320.000,
//   ),
//   Flower(
//     image: "assets/images/CucTrang.png",
//     name: "Cúc trắng",
//     description: [
//
//     ],
//     price: 150.000,
//   )
// ];
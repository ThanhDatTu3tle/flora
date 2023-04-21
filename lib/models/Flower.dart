import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class Flower {
  final String name, image;
  final List<String> description;
  final double price;
  final bool favorite;

  Flower({
  required this.name,
  required this.description,
  required this.image,
  required this.price,
  this.favorite = false,
  });

  factory Flower.fromJson(List<Flower> json) {
    return Flower(
        name: 'name',
        description: ['description'],
        image: 'image',
        price: 0,
        favorite: false,
    );
  }
}

List<Flower> hardFlowers = [
  Flower(
    image: "assets/images/daisy.png",
    name: "Daisy",
    description: [

    ],
    price: 250.000,
    favorite: false,
  ),
  Flower(
    image: "assets/images/HongTrang.png",
    name: "Hồng trắng",
    description: [

    ],
    price: 320.000,
    favorite: false,
  ),
  Flower(
    image: "assets/images/CucTrang.png",
    name: "Cúc trắng",
    description: [

    ],
    price: 150.000,
    favorite: false,
  )
];
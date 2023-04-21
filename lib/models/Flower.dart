import 'package:flutter/material.dart';

class Flower {
  final String name, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite;

  Flower({
  required this.name,
  required this.description,
  required this.images,
  required this.colors,
  this.rating = 0.0,
  required this.price,
  this.isFavourite = false,
  });
}
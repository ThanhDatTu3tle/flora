import 'package:flora/models/Flower.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key, required Flower flowerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FlowerDetailsArguments {
  final Flower product;

  FlowerDetailsArguments({required this.product});
}

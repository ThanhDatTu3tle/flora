import 'package:flora/constants.dart';
import 'package:flora/screens/cart/cart_screen.dart';
import 'package:flora/screens/favorite/favorite_screen.dart';
import 'package:flora/screens/home/components/popular_product.dart';
import 'package:flora/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  static String routeName = "/body";

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SpecialOffers(), // SpecialOffers
          const SizedBox(height: 5),
          Categories(), // Categories
          const SizedBox(height: 5),
          Expanded(
            child: SpecialProduct(),
            // SpecialProduct
          ),
        ],
      ),
    );
  }
}

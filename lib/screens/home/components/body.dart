import 'package:flora/screens/home/components/popular_product.dart';
import 'package:flora/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SpecialOffers(), // SpecialOffers
            const SizedBox(height: 20),
            const Categories(), // Categories
            const SizedBox(height: 20),
            SpecialProduct(), // SpecialProduct
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Flower.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';
import '../../details/details_screen.dart';

class SpecialProduct extends StatelessWidget {
  SpecialProduct({Key? key}) : super(key: key);

  final logger = Logger(
    printer: PrettyPrinter(),
    output: ConsoleOutput(),
  );

  Future<List<Flower>> fetchDataFlower() async {
    try {
      final response = await http.get(Uri.parse("http://169.254.185.208:5000/product"));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final flowers = List<Flower>.from(jsonData.map((flower) => Flower.fromJson(flower)));
        logger.e(flowers);
        return flowers;
      } else {
        throw Exception('Failed to fetch flowers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch flowers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phổ biến",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: kPrimaryColor,
                ),
              ),
              const Text(
                "Xem tất cả",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder<List<Flower>>(
          future: fetchDataFlower(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Failed to fetch flowers: ${snapshot.error.toString()}');
            } else if (snapshot.hasData) {
              final flowers = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flowers.length,
                itemBuilder: (context, index) {
                  final flower = flowers[index];
                  return ProductCard(flower: flower);
                },
              );
            } else {
              return Text('No flowers found.');
            }
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 100,
    this.aspectRetion = 1.02,
    required this.flower,
  }) : super(key: key);

  final double width, aspectRetion;
  final Flower flower;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
        width: getProportionateScreenWidth(width),
    child: GestureDetector(
    onTap: () => Navigator.pushNamed(
    context,
    DetailsScreen.routeName,
    // arguments: ProductDetailsArguments(flower: flower),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    AspectRatio(
    aspectRatio: 1.02,
    child: Container(
    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Hero(
        tag: flower.id.toString(),
        child: Image.asset(flower.image![0]),
      ),
    ),
    ),
      const SizedBox(height: 10),
      Text(
        flower.description![0],
        style: const TextStyle(color: Colors.black),
        maxLines: 2,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${flower.price}",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
        ],
      )
    ],
    ),
    ),
        ),
    );
  }
}



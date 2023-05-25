import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../components/product_card.dart';
import '../../../constants.dart';
import '../../../models/Flower.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ListProduct extends StatelessWidget {
  ListProduct({Key? key}) : super(key: key);

  final logger = Logger(
    printer: PrettyPrinter(),
    output: ConsoleOutput(),
  );

  Future<List<Flower>> fetchDataFlower() async {
    try {
      final response = await http.get(Uri.parse("$api/plant"));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<Flower> flowers = List<Flower>.from(
            jsonData.map((flower) => Flower.fromJson(flower)));
        return flowers;
      } else {
        throw Exception(
            'Failed to fetch flowers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch flowers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          FutureBuilder<List<Flower>>(
            future: fetchDataFlower(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(
                    'Failed to fetch flowers: ${snapshot.error.toString()}');
              } else if (snapshot.hasData) {
                final flowers = snapshot.data!;
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: flowers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        flower: flowers[index],
                      );
                    });
              } else {
                return const Text('No flowers found.');
              }
            },
          ),
        ]);
  }
}

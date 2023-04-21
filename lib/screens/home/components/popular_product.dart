import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../models/Flower.dart';
import '../../../size_config.dart';

class SpecialProduct extends StatefulWidget {
  const SpecialProduct({Key? key}) : super(key: key);

  @override
  State<SpecialProduct> createState() => _SpecialProductState();
}

class _SpecialProductState extends State<SpecialProduct> {
  // Map<Array, dynamic> flowers = [] as Map<Array<NativeType>, dynamic>;
  List<Flower> flowers = [];

  // Future<Flower> fetchFlowers() async {
  //   final response = await http.get(Uri.parse('https://odd-jade-adder-vest.cyclic.app/category/63d133ab7abbc1799c72eeb4'));
  //   if (response.statusCode == 200) {
  //     return Flower.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load user data');
  //   }
  // }

  void fetchFlowers() async {
    const url = 'https://odd-jade-adder-vest.cyclic.app/category/63d133ab7abbc1799c72eeb4';
    final uri = Uri.parse(url);
    final respone = await http.get(uri);
    final body = respone.body;
    final json = jsonDecode(body);
    setState(() {
      flowers = json["category"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   width: getProportionateScreenWidth(200),
        //   child: AspectRatio(
        //     aspectRatio: 1.02,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: kSecondaryColor.withOpacity(0.1),
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: Image.asset(flowers[0].image[0]),
        //     ),
        //   ),
        // ),
        // ListView.builder(
        //   itemCount: flowers.length,
        //   itemBuilder: (context, index) {
        //     final flower = flowers[index];
        //     final image = flower['name'];
        //
        //     return Image.asset(image);
        //   },
        // ),
        // FutureBuilder<Flower>(
        //   future: fetchFlowers(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(snapshot.data!.name);
        //     } else if (snapshot.hasError) {
        //       return Text('${snapshot.error}');
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
      ],
    );
  }

  // https://randomuser.me/api/?results=3




}

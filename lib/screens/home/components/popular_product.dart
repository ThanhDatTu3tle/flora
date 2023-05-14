import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Flower.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';
import 'icon_btn_with_counter.dart';

class SpecialProduct extends StatelessWidget {
  SpecialProduct({Key? key}) : super(key: key);

  int _selectedIndex = 0;
  final logger = Logger(
    printer: PrettyPrinter(),
    output: ConsoleOutput(),
  );

  Future<List<Flower>> fetchDataFlower() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.1.28:5000/product"));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // print(jsonData);
        List<Flower> flowers = List<Flower>.from(
            jsonData.map((flower) => Flower.fromJson(flower)));
        // logger.e(flowers);
        // print(flowers);
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
                    // print(flowers[index]);
                    return ProductCard(
                      flower: flowers[index],
                    );
                  });
            } else {
              return const Text('No flowers found.');
            }
          },
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        const NavigationRailHome()
        // Scaffold(
        //     bottomNavigationBar: BottomNavigationBar(
        //       currentIndex: _selectedIndex,
        //       unselectedItemColor: Colors.grey,
        //       selectedItemColor: Colors.indigoAccent,
        //       onTap: (int index) {
        //         // setState(() {
        //         //   _selectedIndex = index;
        //         // });
        //       },
        //       items: const [
        //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
        //         BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
        //         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Giỏ hàng'),
        //         BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), label: 'Tài khoản'),
        //       ],
        //     )
        // ),
    ]);
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 0.2,
    this.flower,
  }) : super(key: key);

  final double width, aspectRetion;
  final Flower? flower;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: FlowerDetailsArguments(flower: flower),
          // ),
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
                    tag: flower!.id.toString(),
                    child: Image.network(flower!.image!),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Text(
              //   product.title,
              //   style: TextStyle(color: Colors.black),
              //   maxLines: 2,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${flower!.name}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        formatCurrency("${flower!.price}"),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // InkWell(
                      //   borderRadius: BorderRadius.circular(22),
                      //   onTap: () {},
                      //   child: Container(
                      //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      //     height: getProportionateScreenWidth(18),
                      //     width: getProportionateScreenWidth(18),
                      //     decoration: BoxDecoration(
                      //       color: flower!.favorite!
                      //           ? kPrimaryColor.withOpacity(0.15)
                      //           : kSecondaryColor.withOpacity(0.1),
                      //       ),
                      //     ),
                      //   ),
                      IconBthWithCounter(
                        svgSrc: "assets/icons/Heart.svg",
                        press: () { },
                      ),
                      ])
                    ],
                  )
                ],
          ),
        ),
      ),
    );
  }
}

class NavigationRailHome extends StatefulWidget {
  const NavigationRailHome({Key? key}) : super(key: key);

  @override
  State<NavigationRail> createState() => _NavigationRailHomeState();
}

class _NavigationRailHomeState extends State<NavigationRail> {

  final List<Widget> _screens = [
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Trang chủ',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Yêu thích',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Giỏ hàng',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Tài khoản',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.indigoAccent,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Giỏ hàng'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), label: 'Tài khoản'),
        ],
      ),
    );
  }
}


String formatCurrency(String numberString) {
  final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return '${numberString.replaceAllMapped(regex, (match) => '${match[1]}.')}' 'đ';
}

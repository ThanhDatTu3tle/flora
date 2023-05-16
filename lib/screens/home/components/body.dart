import 'package:flora/constants.dart';
import 'package:flora/screens/home/components/popular_product.dart';
import 'package:flora/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

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
            child: SpecialProduct(), // SpecialProduct
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: kPrimaryColor,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Trang chủ'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Yêu thích'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Giỏ hàng'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Tài khoản'),
            ],
          ),
        ],
      ),
    );
  }
}

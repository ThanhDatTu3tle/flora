import 'package:flutter/material.dart';
import 'package:flora/screens/account/account_screen.dart';
import 'package:flora/screens/cart/cart_screen.dart';
import 'package:flora/screens/favorite/favorite_screen.dart';

import '../../constants.dart';
import '../../models/Flower.dart';
import '../details/details_screen.dart';
import '../home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _pages = [
    const Body(),
    const FavoriteScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flora",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

class CartScreenArguments {
  final Flower? flower;

  CartScreenArguments({required this.flower});
}

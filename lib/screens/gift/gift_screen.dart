import 'package:flutter/material.dart';
import 'package:flora/screens/gift/components/body.dart';

import '../../constants.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({Key? key}) : super(key: key);

  static String routeName = "/gift";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quà",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: const Body(

      ),
    );
  }
}

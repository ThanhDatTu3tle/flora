import 'package:flutter/material.dart';
import 'package:flora/screens/flower/components/body.dart';

import '../../constants.dart';

class FlowerScreen extends StatelessWidget {
  const FlowerScreen({Key? key}) : super(key: key);

  static String routeName = "/flower";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hoa",
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

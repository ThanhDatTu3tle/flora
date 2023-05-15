import 'package:flutter/material.dart';
import 'package:flora/screens/plant/components/body.dart';

import '../../constants.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  static String routeName = "/plant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cây cảnh",
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

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });
  final String title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(350),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(44),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
          ),
        ),
      ],
    );
  }
}
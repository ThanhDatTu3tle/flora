import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final VoidCallback press;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: kPrimaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(55),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
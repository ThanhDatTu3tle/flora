import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Giỏ hàng",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(22),
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chọn tất cả (4 món)",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: kPrimaryColor,
                  ),
                ),
                const Text(
                  "Xóa tất cả",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flora/screens/flower/components/list_product.dart';
import 'package:flora/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flora/constants.dart';

import '../../../size_config.dart';
import '../../home/components/icon_btn_with_counter.dart';

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
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchField(),
                IconBthWithCounter(
                  svgSrc: "assets/icons/Filter.svg",
                  press: () { },
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Các sản phẩm",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Expanded(child: ListProduct())
        ],
      ),
    );
  }
}

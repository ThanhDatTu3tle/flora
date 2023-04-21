import 'package:flora/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBthWithCounter(
            svgSrc: "assets/icons/Cart.svg",
            press: () {  },
          ),
          IconBthWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItems: 2,
            press: () {  },
          ),
        ],
      ),
    );
  }
}
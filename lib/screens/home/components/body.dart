import 'package:flora/constants.dart';
import 'package:flora/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const HomeHeader(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferCard(
                    image: "assets/images/banner_2.png",
                    press: () {  },
                  ),
                  SpecialOfferCard(
                    image: "assets/images/banner_1.png",
                    press: () {  },
                  ),
                  SpecialOfferCard(
                    image: "assets/images/banner_3.png",
                    press: () {  },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20),)
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Categories(),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phổ biến",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: kPrimaryColor,
                    ),
                  ),
                  const Text(
                    "Xem tất cả",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






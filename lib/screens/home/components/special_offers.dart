import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'home_header.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(), // HomeHeader
        const SizedBox(height: 20),
        SingleChildScrollView( // SpecialOffer
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/banner_2.png",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/banner_1.png",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/banner_3.png",
                press: () {},
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(242),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
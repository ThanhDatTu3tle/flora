import 'package:flora/constants.dart';
import 'package:flora/models/Flower.dart';
import 'package:flora/screens/home/components/popular_product.dart';
import 'package:flora/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';
import 'categories.dart';
import 'home_header.dart';
import 'icon_btn_with_counter.dart';

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
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Image.network(
                  //   FlowerModel.image!
                  // ),
                  SizedBox(width: getProportionateScreenWidth(20),)
                ],
              ),
            ),
            // const SpecialProduct()
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.flower,
  });

  final double width, aspectRetion;
  final FlowerModel flower;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRetion,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(width)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset((flower.image).toString()),
                ),
              ),
              // Text(
              //   flower.name,
              //   style: TextStyle(
              //     fontSize: getProportionateScreenWidth(20),
              //     fontWeight: FontWeight.w600,
              //     color: kPrimaryColor,
              //   ),
              //   maxLines: 3,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${flower.price}00 đ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        width: getProportionateScreenWidth(33),
                        height: getProportionateScreenWidth(33),
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/Heart.svg")
                      // Image.asset("assest/icons/Heart.svg"),
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}




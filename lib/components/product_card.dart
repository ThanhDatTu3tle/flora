import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/Flower.dart';
import '../screens/details/details_screen.dart';
import '../screens/home/components/icon_btn_with_counter.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 0,
    this.flower,
  }) : super(key: key);

  final double width, aspectRetion;
  final Flower? flower;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: FlowerDetailsArguments(flower: flower!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: flower!.id.toString(),
                    child: Image.network(flower!.image!),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Text(
              //   product.title,
              //   style: TextStyle(color: Colors.black),
              //   maxLines: 2,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${flower!.name}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        formatCurrency("${flower!.price}"),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // InkWell(
                        //   borderRadius: BorderRadius.circular(22),
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        //     height: getProportionateScreenWidth(18),
                        //     width: getProportionateScreenWidth(18),
                        //     decoration: BoxDecoration(
                        //       color: flower!.favorite!
                        //           ? kPrimaryColor.withOpacity(0.15)
                        //           : kSecondaryColor.withOpacity(0.1),
                        //       ),
                        //     ),
                        //   ),
                        IconBthWithCounter(
                          svgSrc: "assets/icons/Heart.svg",
                          press: () { },
                        ),
                      ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String formatCurrency(String numberString) {
  final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return '${numberString.replaceAllMapped(regex, (match) => '${match[1]}.')}' 'đ';
}
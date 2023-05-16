import 'package:flora/models/Flower.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../components/product_card.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../home/components/icon_btn_with_counter.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key, required Flower flowerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Nhận đối số truyền từ ProductCard
    final args = ModalRoute.of(context)!.settings.arguments as FlowerDetailsArguments;
    final flower = args.flower;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flora",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
        child: SizedBox(
          child: Column(
            children: [
              Image.network(
                "${flower!.image}",
                height: getProportionateScreenHeight(300),
                width: getProportionateScreenWidth(600),
                alignment: Alignment.center,
              ),
              const SizedBox(height: 30),
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
                          fontSize: getProportionateScreenWidth(27),
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        formatCurrency("Giá: ${flower!.price}"),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Giới thiệu",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(120),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconBthWithCounter(
                          svgSrc: "assets/icons/Cart.svg",
                          press: () { },
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
                            ]),
                      ],
                    ),
                  )

                ],
              ),

              SizedBox(
                width: getProportionateScreenWidth(333),
                child: SingleChildScrollView(
                  child: Text(
                    "${flower!.description}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: DefaultButton(
                    text: "Đặt hàng",
                    press: () {

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class FlowerDetailsArguments {
  final Flower flower;

  FlowerDetailsArguments({required this.flower});
}

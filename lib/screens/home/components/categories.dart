import 'package:flora/screens/card/card_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  // Danh sách các màn hình danh mục tương ứng
  final List<Widget> categoryScreens = [
    const CardScreen(),
    // Category2Screen(),
    // Category3Screen(),
    // Category4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"image": "assets/images/card.png", "text": "Thiệp"},
      {"image": "assets/images/tree.png", "text": "Cây cảnh"},
      {"image": "assets/images/gift.png", "text": "Quà"},
      {"image": "assets/images/flower.png", "text": "Hoa"},
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Danh mục",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  categories.length,
                  (index) => CategoryCard(
                    image: categories[index]["image"],
                    text: categories[index]["text"],
                    press: () {
                      // Chuyển hướng đến màn hình danh mục tương ứng
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => categoryScreens[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  final String image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(66),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset(
                  image,
                  width: getProportionateScreenWidth(55),
                  height: getProportionateScreenHeight(55),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

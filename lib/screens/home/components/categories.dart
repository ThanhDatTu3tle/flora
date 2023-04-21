import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "image": "assets/images/card.png",
        "text": "Thiệp"
      },
      {
        "image": "assets/images/tree.png",
        "text": "Cây cảnh"
      },
      {
        "image": "assets/images/gift.png",
        "text": "Quà"
      },
      {
        "image": "assets/images/flower.png",
        "text": "Hoa"
      },
    ];

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              categories.length,
                  (index) => CategoryCard(
                  image: categories[index]["image"],
                  text: categories[index]["text"],
                  press: () {}
              ),
            ),
          ],
        )
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
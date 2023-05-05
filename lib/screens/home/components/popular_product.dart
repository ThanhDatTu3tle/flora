import 'package:flora/data/data.dart';
import 'package:flora/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Flower.dart';
import '../../../size_config.dart';

class SpecialProduct extends StatefulWidget {
  const SpecialProduct({Key? key}) : super(key: key);

  @override
  State<SpecialProduct> createState() => _SpecialProductState();
}

class _SpecialProductState extends State<SpecialProduct> {
  List<FlowerModel> flowers = [];
  Future<String> loadList() async {
    flowers = await ReadData().loadDataList();
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(200),
          child: AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(flowers[0].image!),
            ),
          ),
        ),
        ListView.builder(
          itemCount: flowers.length,
          itemBuilder: (context, index) {
            final flower = flowers[index];
            final image = flower.image;

            return Image.asset(image!);
          },
        ),
        FutureBuilder(
          future: loadList(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    "Card product",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 30,
                    ),
                    
                  ),
                  Expanded(child: ListView.builder(itemBuilder: (context, index) {
                    return itemListView(flowers[index]);
                  }))
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget itemListView(FlowerModel flowerModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  flowerModel: flowerModel,
                )
            )
        );
      },
    );
  }
}



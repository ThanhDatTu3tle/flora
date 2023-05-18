import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/cart_provider.dart';
import '../../components/default_button.dart';
import '../../constants.dart';
import '../../models/Flower.dart';
import '../../size_config.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  const DetailsScreen({
    Key? key,
    required this.flower,
  }) : super(key: key);

  final Flower? flower;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // late Flower flower;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   flower = widget.flower!;
  // }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

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
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            Image.network(
              "${widget.flower!.image}",
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
                      "${widget.flower!.name}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(27),
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      formatCurrency("Giá: ${widget.flower!.price}"),
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
                GestureDetector(
                  onTap: () {
                    cartProvider.addToCart(widget.flower!);
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: getProportionateScreenWidth(20),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(333),
              child: SingleChildScrollView(
                child: Text(
                  "${widget.flower!.description}",
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
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlowerDetailsArguments {
  final Flower flower;

  FlowerDetailsArguments({required this.flower});
}

String formatCurrency(String numberString) {
  final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return '${numberString.replaceAllMapped(regex, (match) => '${match[1]}.')}đ';
}

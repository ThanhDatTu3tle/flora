import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/cart_provider.dart';
import '../../constants.dart';
import '../../models/Flower.dart';
import '../../size_config.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
        body: cartItems.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Giỏ hàng",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            cartProvider.clearFavorites();
                          },
                          child: const Text(
                            "Xóa tất cả",
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return ListTile(
                        leading: Image.network(cartItem.image!),
                        title: Text(cartItem.name!),
                        subtitle: Text(formatCurrency("${cartItem.price}")),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.removeFromCart(cartItem);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  )),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Giỏ hàng",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text("Không có sản phẩm trong Giỏ hàng của bạn!"),
                  ),
                ],
              ));
  }
}

class FlowerDetailsArguments {
  final Flower flower;

  FlowerDetailsArguments({required this.flower});
}

class CartScreenArguments {
  final Flower cartItem;

  CartScreenArguments({required this.cartItem});
}

String formatCurrency(String numberString) {
  final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return '${numberString.replaceAllMapped(regex, (match) => '${match[1]}.')}đ';
}

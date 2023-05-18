import 'package:flora/constants.dart';
import 'package:flora/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/favorite_provider.dart';
import '../../size_config.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static String routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = favoriteProvider.favoriteItems;

    return Scaffold(
      body: favoriteItems.isNotEmpty
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
                        "Yêu thích",
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
                          favoriteProvider.clearFavorites();
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
                    itemCount: favoriteItems.length,
                    itemBuilder: (context, index) {
                      final favoriteItem = favoriteItems[index];
                      return ListTile(
                        leading: Image.network(favoriteItem.image!),
                        title: Text(favoriteItem.name!),
                        subtitle: Text(formatCurrency("${favoriteItem.price}")),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      flower: favoriteItem,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: kPrimaryColor,
                              ),
                              child: const Text("Xem chi tiết"),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                favoriteProvider
                                    .removeFromFavorite(favoriteItem);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
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
                        "Yêu thích",
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
                  child: Text(
                      "Không có sản phẩm trong danh mục Yêu thích của bạn!"),
                ),
              ],
            ),
    );
  }
}

String formatCurrency(String numberString) {
  final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return '${numberString.replaceAllMapped(regex, (match) => '${match[1]}.')}'
      'đ';
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/favorite_provider.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key, required List<String> favoriteItems}) : super(key: key);
//
//   @override
//   State<Body> createState() => _BodyState();
// }

class Body extends StatelessWidget {

  const Body({Key? key}) : super(key: key);

  static String routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = favoriteProvider.favoriteItems;

    return SafeArea(
      child: Column(
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
              children: const [
                Text(
                  "Xóa tất cả",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          favoriteItems.isNotEmpty
              ? ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final favoriteItem = favoriteItems[index];
              return ListTile(
                leading: Image.network(favoriteItem.image!),
                title: Text(favoriteItem.name!),
                subtitle: Text(formatCurrency("${favoriteItem.price}")),
                // Cung cấp phương thức để xóa sản phẩm khỏi danh sách yêu thích
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    favoriteProvider.removeFromFavorite(favoriteItem);
                  },
                ),
              );
            },
          )
              : const Center(
            child: Text("No favorite products."),
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


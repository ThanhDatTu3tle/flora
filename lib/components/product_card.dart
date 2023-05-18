import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/Flower.dart';
import '../screens/details/details_screen.dart';
import '../size_config.dart';
import 'favorite_provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 100,
    this.aspectRatio = 1,
    this.flower,
  }) : super(key: key);

  final double width, aspectRatio;
  final Flower? flower;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(flower: widget.flower),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: widget.aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.flower!.id.toString(),
                    child: Image.network(widget.flower!.image!),
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        formatCurrency("${widget.flower!.price}"),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });

                      // Thêm phần xử lý truyền sản phẩm vào danh sách yêu thích
                      if (isFavorite) {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .addToFavorite(widget.flower!);
                        showToast("Thêm vào Yêu thích");
                      } else {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .removeFromFavorite(widget.flower!);
                        cancelToast("Xóa khỏi Yêu thích");
                      }
                    },
                    child: Container(
                      padding:
                      EdgeInsets.all(getProportionateScreenWidth(4)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: isFavorite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? kPrimaryColor : Colors.grey,
                        size: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
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

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green.shade200,
    textColor: Colors.green,
    fontSize: 18.0,
  );
}

  void cancelToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red.shade200,
      textColor: Colors.red,
      fontSize: 18.0,
    );
  }

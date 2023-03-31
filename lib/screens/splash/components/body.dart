import 'package:flora/constants.dart';
import 'package:flora/screens/sign_in/sign_in_screen.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Flowers",
      "text": "Để cho dịp đặc biệt\n càng thêm ý nghĩa",
      "image": "assets/images/splash_1.png"
    },
    {
      "title": "Browse",
      "text": "Lựa chọn loại hoa dành\n cho bạn hay người thân",
      "image": "assets/images/splash_2.png"
    },
    {
      "title": "Ready",
      "text": "Để trải nghiệm muôn vàng\n loại hoa với nhiều màu sắc",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      title: splashData[index]["title"].toString(),
                      text: splashData[index]["text"].toString(),
                      image: splashData[index]["image"].toString(),
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                                  (index) => buildDot(index: index),
                            ),
                          ),
                          const Spacer(flex: 1),
                          DefaultButton(
                            text: 'Continue',
                            press: () {
                              Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                          ),
                          const Spacer(),
                        ],
                      )
                  ),
                ),
              ],
            )
        )
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8) ,
          borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}



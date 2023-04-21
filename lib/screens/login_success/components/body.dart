import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22)),
              child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.07),
                    Image.asset(
                      "assets/images/login_success.png",
                      width: SizeConfig.screenHeight! * 0.7,
                      height: SizeConfig.screenHeight! * 0.6,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: DefaultButton(
                        text: "Tiếp tục",
                        press: () => Navigator.pushNamed(context, HomeScreen.routeName),
                      ),
                    ),
                  ],
              ),
            ),
        ),
    );
  }
}

import 'package:flora/screens/sign_in/components/sign_form.dart';
import 'package:flora/screens/sign_in/components/social_card.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
            child: Column(
            children: [
              Image.asset(
                "assets/images/sign_in.png",
                height: getProportionateScreenHeight(280),
                width: getProportionateScreenWidth(600),
                alignment: Alignment.center,
              ),
              const SignForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/facebook.png",
                    press: () { },
                  ),

                  SocialCard(
                    icon: "assets/icons/google.png",
                    press: () { },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

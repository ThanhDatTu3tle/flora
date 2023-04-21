import 'package:flora/constants.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView (
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              const Text("Chúng tôi sẽ gửi mã xác thực đến \n số điện thoại +84 587 764 127"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight! * 0.15),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              GestureDetector(
                  onTap: () {
                    // login_success
                  },
                  child: const Text(
                    "Vui lòng gửi lại mã OTP",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Mã xác thực sẽ hết hạn trong vòng"),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
              " ${value.toInt()} giây nữa",
              style: const TextStyle(
                color: kPrimaryColor,
              ),
            ),
          onEnd: () {},
        ),
      ],
    );
  }
}

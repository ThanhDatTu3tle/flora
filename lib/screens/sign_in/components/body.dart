import 'package:flora/components/default_button.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
            children: [
              Image.asset(
                "assets/images/sign_in.png",
                height: getProportionateScreenHeight(400),
                width: getProportionateScreenWidth(500),
                alignment: Alignment.center,
              ),
              const SignFom(),
            ],
          )
        )
      )
    );
  }
}

class SignFom extends StatefulWidget {
  const SignFom({Key? key}) : super(key: key);

  @override
  State<SignFom> createState() => _SignFomState();
}

class _SignFomState extends State<SignFom> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Tài khoản email",
                hintText: "Nhập email của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(22),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mật khẩu",
                hintText: "Nhập mật khẩu của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              "Quên mật khẩu?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            DefaultButton(
              text: "Đăng nhập",
              press: () {},
            ),
          ],
        )
    );
  }
}


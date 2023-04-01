import 'package:flora/components/default_button.dart';
import 'package:flora/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
            child: Column(
            children: [
              Image.asset(
                "assets/images/sign_in.png",
                height: getProportionateScreenHeight(280),
                width: getProportionateScreenWidth(666),
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
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;

    return Form(
      key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    errors.add("Please enter your email!");
                  });
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Tài khoản email",
                hintText: "Nhập email của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(14),
                      getProportionateScreenWidth(14),
                      getProportionateScreenWidth(14)
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Mail.svg",
                    height: getProportionateScreenWidth(14),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(22),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                hintText: "Nhập mật khẩu của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(10)
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Lock.svg",
                    height: getProportionateScreenWidth(14),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                // Text(errors[0])
              ],
            ),
            Row(
              mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.end,
              children: const [
                Text(
                  "Quên mật khẩu?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            DefaultButton(
              text: "Đăng nhập",
              press: () {},
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Row(
              mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.center,
              children: const [
                Text(
                  "Bạn không có tài khoản?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kTextColor,
                  ),
                ),
                Text(
                  "Đăng ký",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}


import 'package:flora/components/default_button.dart';
import 'package:flora/components/form_error_password.dart';
import 'package:flora/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../components/form_error_conform_password.dart';
import '../../../components/form_error_email.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22)),
        child: Column(
          children: [
            const Text(
              "Tạo tài khoản để tiếp tục!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: kTextColor,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            const SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
          ],
        ),
      ),
    );
  }
}

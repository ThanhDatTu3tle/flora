import 'package:flora/components/default_button.dart';
import 'package:flora/components/form_error_email.dart';
import 'package:flora/screens/sign_in/sign_in_screen.dart';
import 'package:flora/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../forgot_password_screen.dart';


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
              Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )
              ),
              const Text(
                "Vui lòng cung cấp email của bạn, chúng tôi sẽ gửi đến link để lấy lại mật khẩu đã quên của bạn",
                textAlign: TextAlign.center,
              ),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  late List<String> emailErrors = [];
  late String email;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    return Form(
        key: _formKey,
        child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(55),
              ),
              TextFormField(
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue!,
                onChanged: (value) {
                  if (value.isEmpty && emailErrors.contains(kEmailNullError)) {
                    setState(() {
                      emailErrors.remove(kEmailNullError);
                    });
                  } else if (emailValidatorRegExp.hasMatch(value) && emailErrors.contains(kInvalidEmailError)) {
                    setState(() {
                      emailErrors.remove(kInvalidEmailError);
                    });
                  }
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty && !emailErrors.contains(kEmailNullError)) {
                    setState(() {
                      emailErrors.add(kEmailNullError);
                    });
                  } else if (!emailValidatorRegExp.hasMatch(value) && !emailErrors.contains(kInvalidEmailError)) {
                    setState(() {
                      emailErrors.add(kInvalidEmailError);
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
                    child: const Icon(
                      Icons.mail_outline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              FormErrorEmail(emailErrors: emailErrors),
              SizedBox(
                height: getProportionateScreenHeight(55),
              ),
              DefaultButton(
                text: "Tiếp tục",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // _formKey.currentState?.save();
                  }
                }
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn không có tài khoản?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(
                        context, SignUpScreen.routeName),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
        ),
    );
  }
}


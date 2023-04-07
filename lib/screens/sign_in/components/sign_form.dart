import 'package:flora/screens/forgot_password/forgot_password_screen.dart';
import 'package:flora/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error_email.dart';
import '../../../components/form_error_password.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late bool remember = false;
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;

    return Form(
        key: _formKey,
        child: Column(
          children: [
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
                  // return "";
                } else if (!emailValidatorRegExp.hasMatch(value) && !emailErrors.contains(kInvalidEmailError)) {
                  setState(() {
                    emailErrors.add(kInvalidEmailError);
                  });
                  // return "";
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
              height: getProportionateScreenHeight(1),
            ),
            FormErrorEmail(emailErrors: emailErrors),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            TextFormField(
              cursorColor: kPrimaryColor,
              obscureText: true,
              onSaved: (newValue) => password = newValue!,
              onChanged: (value) {
                if (value.isEmpty && passwordErrors.contains(kPassNullError)) {
                  setState(() {
                    passwordErrors.remove(kPassNullError);
                  });
                } else if (value.length >= 8 && passwordErrors.contains(kShortPassError)) {
                  setState(() {
                    passwordErrors.remove(kShortPassError);
                  });
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty && !passwordErrors.contains(kPassNullError)) {
                  setState(() {
                    passwordErrors.add(kPassNullError);
                  });
                  // return "";
                } else if (value.length < 8 && !passwordErrors.contains(kShortPassError)) {
                  setState(() {
                    passwordErrors.add(kShortPassError);
                  });
                  // return "";
                }
                return null;
              },
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
                  child: const Icon(
                    Icons.lock_outline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(1),
            ),
            FormErrorPassword(passwordErrors: passwordErrors),
            Row(
              // mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.center,
              children:  [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text(
                  "Ghi nhớ đăng nhập?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            DefaultButton(
              text: "Đăng nhập",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();

                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              },
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
                  // onTap: () => Navigator.popAndPushNamed(
                      // context, ForgotPasswordScreen.routeName),
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
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
          ],
        )
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flora/screens/forgot_password/forgot_password_screen.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error_email.dart';
import '../../../components/form_error_password.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (error) {
      if (kDebugMode) {
        print("Đăng nhập thất bại: $error");
      }
      return null;
    }
  }
}

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

  void addEmailError({required String emailError}) {
    if (!emailErrors.contains(emailError)) {
      setState(() {
        emailErrors.add(emailError);
      });
    }
  }
  void addPasswordError({required String passwordError}) {
    if (!passwordErrors.contains(passwordError)) {
      setState(() {
        passwordErrors.add(passwordError);
      });
    }
  }

  void removeEmailError({required String emailError}) {
    if (!emailErrors.contains(emailError)) {
      setState(() {
        emailErrors.remove(emailError);
      });
    }
  }
  void removePasswordError({required String passwordError}) {
    if (!passwordErrors.contains(passwordError)) {
      setState(() {
        passwordErrors.remove(passwordError);
      });
    }
  }

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
                if (value.isNotEmpty) {
                  removeEmailError(emailError: kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(value)) {
                  removeEmailError(emailError: kInvalidEmailError);
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addEmailError(emailError: kEmailNullError);
                  return "";
                } else if (!emailValidatorRegExp.hasMatch(value)) {
                  addEmailError(emailError: kInvalidEmailError);
                  return "";
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
                if (value.isNotEmpty) {
                  removePasswordError(passwordError: kPassNullError);
                } else if (value.length >= 8) {
                  removePasswordError(passwordError: kShortPassError);
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addPasswordError(passwordError: kPassNullError);
                  return "";
                } else if (value.length < 8) {
                  addPasswordError(passwordError: kShortPassError);
                  return "";
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
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();

                  AuthService authService = AuthService();
                  User? user = await authService.signInWithEmailAndPassword(email, password);

                  // Kiểm tra xem email đã nhập có nằm trong danh sách các email đã đăng ký hay không
                  if (user != null) {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Lỗi đăng nhập"),
                          content: Text("Email hoặc mật khẩu không chính xác."),
                          actions: [
                            TextButton(
                              child: Text("Đóng"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
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
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
          ],
        )
    );
  }
}
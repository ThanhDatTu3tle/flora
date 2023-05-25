import 'package:firebase_auth/firebase_auth.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late bool remember = false;
  late String username;
  late String email;
  late String password;
  late String phoneNumber;
  late String confirmPassword;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerUser(String email, String password) async {
    try {
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Xử lý thành công, ví dụ: chuyển đến màn hình thành công
    } catch (e) {
      // Xử lý lỗi, ví dụ: hiển thị thông báo lỗi
      if (kDebugMode) {
        print('Đăng ký không thành công: $e');
      }
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
            onSaved: (newValue) => username = newValue!,
            decoration: const InputDecoration(
              labelText: "Tên người dùng",
              hintText: "Nhập tên người dùng",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập email';
              } else if (!value.contains('@')) {
                return 'Email không hợp lệ';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Nhập email của bạn',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue!,
            onChanged: (value) {
              // Thực hiện các kiểm tra hoặc xử lý khi giá trị của trường số điện thoại thay đổi
            },
            validator: (value) {
              // Thực hiện kiểm tra hợp lệ của trường số điện thoại và trả về thông báo lỗi nếu có
              return null;
            },
            decoration: InputDecoration(
              labelText: "Số điện thoại",
              hintText: "Nhập số điện thoại của bạn",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(14),
                    getProportionateScreenWidth(14),
                    getProportionateScreenWidth(14)
                ),
                child: const Icon(
                  Icons.phone,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            cursorColor: kPrimaryColor,
            obscureText: true,
            onSaved: (newValue) => password = newValue!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value.length < 6) {
                return 'Mật khẩu phải có ít nhất 6 ký tự';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Mật khẩu',
              hintText: 'Nhập mật khẩu của bạn',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            cursorColor: kPrimaryColor,
            obscureText: true,
            onSaved: (newValue) => confirmPassword = newValue!,
            onChanged: (value) {
              // Thực hiện các kiểm tra hoặc xử lý khi giá trị của trường nhập lại mật khẩu thay đổi
            },
            validator: (value) {
              // Thực hiện kiểm tra hợp lệ của trường nhập lại mật khẩu và trả về thông báo lỗi nếu có
              return null;
            },
            decoration: InputDecoration(
              labelText: "Xác nhận mật khẩu",
              hintText: "Nhập lại mật khẩu của bạn",
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
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
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
                "Để tạo một tài khoản, bạn cần phải đồng ý với \n Điều khoản & Điều kiện dịch vụ",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(22),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              fixedSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, getProportionateScreenHeight(55))
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, getProportionateScreenHeight(55))
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                registerUser(email, password);

                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
            child: const Text(
              'Đăng ký',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.center,
            children: [
              const Text(
                "Bạn đã có tài khoản?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kTextColor,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, SignInScreen.routeName),
                child: const Text(
                  "Đăng nhập",
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








// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flora/screens/otp/otp_screen.dart';
// import 'package:flora/screens/sign_in/sign_in_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../../components/default_button.dart';
// import '../../../components/form_error_conform_password.dart';
// import '../../../components/form_error_email.dart';
// import '../../../components/form_error_password.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';
// import '../../login_success/login_success_screen.dart';
//
// class SignUpForm extends StatefulWidget {
//   const SignUpForm({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }
//
// class _SignUpFormState extends State<SignUpForm> {
//   final _formKey = GlobalKey<FormState>();
//   late bool remember = false;
//   late String email;
//   late String password;
//   late String conform_password;
//
//   // late FirebaseAuth _firebaseAuth;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   final List<String> emailErrors = [];
//   final List<String> passwordErrors = [];
//   final List<String> conformPasswordErrors = [];
//
//   void addEmailError({required String emailError}) {
//     if (!emailErrors.contains(emailError)) {
//       setState(() {
//         emailErrors.add(emailError);
//       });
//     }
//   }
//   void addPasswordError({required String passwordError}) {
//     if (!passwordErrors.contains(passwordError)) {
//       setState(() {
//         passwordErrors.add(passwordError);
//       });
//     }
//   }
//   void addConformPasswordError({required String conformPasswordError}) {
//     if (!conformPasswordErrors.contains(conformPasswordError)) {
//       setState(() {
//         conformPasswordErrors.add(conformPasswordError);
//       });
//     }
//   }
//
//   void removeEmailError({required String emailError}) {
//     if (!emailErrors.contains(emailError)) {
//       setState(() {
//         emailErrors.remove(emailError);
//       });
//     }
//   }
//   void removePasswordError({required String passwordError}) {
//     if (!passwordErrors.contains(passwordError)) {
//       setState(() {
//         passwordErrors.remove(passwordError);
//       });
//     }
//   }
//   void removeConformPasswordError({required String conformPasswordError}) {
//     if (!conformPasswordErrors.contains(conformPasswordError)) {
//       setState(() {
//         conformPasswordErrors.remove(conformPasswordError);
//       });
//     }
//   }
//
//   void registerUser(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       // Xử lý thành công, ví dụ: chuyển đến màn hình thành công
//     } catch (e) {
//       // Xử lý lỗi, ví dụ: hiển thị thông báo lỗi
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     _firebaseAuth;
//   }
//
//   Future<void> _signUp() async {
//     try {
//       final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Đăng ký thành công, bạn có thể thực hiện các hành động sau đây, ví dụ như lưu thông tin người dùng vào cơ sở dữ liệu.
//
//       Navigator.pushNamed(context, OtpScreen.routeName);
//     } catch (e) {
//       // Xảy ra lỗi trong quá trình đăng ký, xử lý và hiển thị thông báo lỗi tùy ý.
//       print('Đăng ký không thành công: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     MainAxisAlignment mainAxisAlignment;
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue!,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeEmailError(emailError: kEmailNullError);
//               } else if (emailValidatorRegExp.hasMatch(value)) {
//                 removeEmailError(emailError: kInvalidEmailError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addEmailError(emailError: kEmailNullError);
//                 // return "";
//               } else if (!emailValidatorRegExp.hasMatch(value)) {
//                 addEmailError(emailError: kInvalidEmailError);
//                 // return "";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Tài khoản",
//               hintText: "Nhập tên tài khoản của bạn",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     0,
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14)
//                 ),
//                 child: const Icon(
//                   Icons.person_outline,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(1),
//           ),
//           // FormErrorEmail(emailErrors: emailErrors),
//           SizedBox(
//             height: getProportionateScreenHeight(15),
//           ),
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue!,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeEmailError(emailError: kEmailNullError);
//               } else if (emailValidatorRegExp.hasMatch(value)) {
//                 removeEmailError(emailError: kInvalidEmailError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addEmailError(emailError: kEmailNullError);
//                 return "";
//               } else if (!emailValidatorRegExp.hasMatch(value)) {
//                 addEmailError(emailError: kInvalidEmailError);
//                 return "";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Tài khoản email",
//               hintText: "Nhập email của bạn",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     0,
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14)
//                 ),
//                 child: const Icon(
//                   Icons.mail_outline,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(1),
//           ),
//           FormErrorEmail(emailErrors: emailErrors),
//           SizedBox(
//             height: getProportionateScreenHeight(15),
//           ),
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue!,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeEmailError(emailError: kEmailNullError);
//               } else if (emailValidatorRegExp.hasMatch(value)) {
//                 removeEmailError(emailError: kInvalidEmailError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addEmailError(emailError: kEmailNullError);
//                 // return "";
//               } else if (!emailValidatorRegExp.hasMatch(value)) {
//                 addEmailError(emailError: kInvalidEmailError);
//                 // return "";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Số điện thoại",
//               hintText: "Nhập số điện thoại của bạn",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     0,
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14),
//                     getProportionateScreenWidth(14)
//                 ),
//                 child: const Icon(
//                   Icons.phone,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(1),
//           ),
//           // FormErrorEmail(emailErrors: emailErrors),
//           SizedBox(
//             height: getProportionateScreenHeight(15),
//           ),
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             obscureText: true,
//             onSaved: (newValue) => password = newValue!,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removePasswordError(passwordError: kPassNullError);
//               } else if (value.length >= 8) {
//                 removePasswordError(passwordError: kShortPassError);
//               }
//               password = value;
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addPasswordError(passwordError: kPassNullError);
//                 // return "";
//               } else if (value.length < 8) {
//                 addPasswordError(passwordError: kShortPassError);
//                 // return "";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Mật khẩu",
//               hintText: "Nhập mật khẩu của bạn",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     0,
//                     getProportionateScreenWidth(10),
//                     getProportionateScreenWidth(10),
//                     getProportionateScreenWidth(10)
//                 ),
//                 child: const Icon(
//                   Icons.lock_outline,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(1),
//           ),
//           FormErrorPassword(passwordErrors: passwordErrors),
//           SizedBox(
//             height: getProportionateScreenHeight(15),
//           ),
//           TextFormField(
//             cursorColor: kPrimaryColor,
//             obscureText: true,
//             onSaved: (newValue) => conform_password = newValue!,
//             onChanged: (value) {
//               if (password == conform_password) {
//                 removeConformPasswordError(conformPasswordError: kMatchPassError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 // return "";
//               } else if (password != value) {
//                 addConformPasswordError(conformPasswordError: kMatchPassError);
//                 // return "";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Xác nhận mật khẩu",
//               hintText: "Nhập lại mật khẩu của bạn",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     0,
//                     getProportionateScreenWidth(10),
//                     getProportionateScreenWidth(10),
//                     getProportionateScreenWidth(10)
//                 ),
//                 child: const Icon(
//                   Icons.lock_outline,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(1),
//           ),
//           FormErrorConformPassword(conformPasswordErrors: conformPasswordErrors),
//           SizedBox(
//             height: getProportionateScreenHeight(22),
//           ),
//           Row(
//             children: [
//               Checkbox(
//                 value: remember,
//                 activeColor: kPrimaryColor,
//                 onChanged: (value) {
//                   setState(() {
//                     remember = value!;
//                   });
//                 },
//               ),
//               const Text(
//                 "Để tạo một tài khoản, bạn cần phải đồng ý với \n Điều khoản & Điều kiện dịch vụ",
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(22),
//           ),
//           // DefaultButton(
//           //   text: "Đăng ký",
//           //   press: () {
//           //     if (_formKey.currentState!.validate()) {
//           //       _formKey.currentState?.save();
//           //       _signUp();
//           //     }
//           //   },
//           // ),
//           ElevatedButton(
//             onPressed: () {
//               registerUser(emailVariable, passwordVariable); // Thay thế emailVariable và passwordVariable bằng biến trong State của bạn
//             },
//             child: Text('Đăng ký'),
//           ),
//
//           SizedBox(
//             height: getProportionateScreenHeight(15),
//           ),
//           Row(
//             mainAxisAlignment: mainAxisAlignment = MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Bạn đã có tài khoản?",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.normal,
//                   color: kTextColor,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => Navigator.popAndPushNamed(
//                     context, SignInScreen.routeName),
//                 child: const Text(
//                   "Đăng nhập",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                     color: kPrimaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



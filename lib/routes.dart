import 'package:flora/screens/forgot_password/forgot_password_screen.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/login_success/login_success_screen.dart';
import 'package:flora/screens/otp/otp_screen.dart';
import 'package:flora/screens/sign_in/sign_in_screen.dart';
import 'package:flora/screens/sign_up/sign_up_screen.dart';
import 'package:flora/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),

  SignInScreen.routeName: (context) => const SignInScreen(),

  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),

  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),

  SignUpScreen.routeName: (context) => const SignUpScreen(),

  OtpScreen.routeName: (context) => const OtpScreen(),

  HomeScreen.routeName: (context) => const HomeScreen(),
};
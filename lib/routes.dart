import 'package:flora/screens/forgot_password/forgot_password_screen.dart';
import 'package:flora/screens/login_success/login_success_screen.dart';
import 'package:flora/screens/sign_in/sign_in_screen.dart';
import 'package:flora/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),

  SignInScreen.routeName: (context) => const SignInScreen(),

  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),

  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
};
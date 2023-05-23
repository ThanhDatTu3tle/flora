import 'package:flora/models/Flower.dart';
import 'package:flora/screens/card/card_screen.dart';
import 'package:flora/screens/cart/cart_screen.dart';
import 'package:flora/screens/details/details_screen.dart';
import 'package:flora/screens/favorite/favorite_screen.dart';
import 'package:flora/screens/flower/flower_screen.dart';
import 'package:flora/screens/forgot_password/forgot_password_screen.dart';
import 'package:flora/screens/gift/gift_screen.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/login_success/login_success_screen.dart';
import 'package:flora/screens/otp/otp_screen.dart';
import 'package:flora/screens/plant/plant_screen.dart';
import 'package:flora/screens/sign_in/sign_in_screen.dart';
import 'package:flora/screens/sign_up/sign_up_screen.dart';
import 'package:flora/screens/splash/splash_screen.dart';
import 'package:flora/screens/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),

  SignInScreen.routeName: (context) => const SignInScreen(),

  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),

  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),

  SignUpScreen.routeName: (context) => const SignUpScreen(),

  OtpScreen.routeName: (context) => const OtpScreen(),

  HomeScreen.routeName: (context) => const HomeScreen(),

  DetailsScreen.routeName: (context) => DetailsScreen(flower: Flower()),

  CardScreen.routeName: (context) => const CardScreen(),

  PlantScreen.routeName: (context) => const PlantScreen(),

  GiftScreen.routeName: (context) => const GiftScreen(),

  FlowerScreen.routeName: (context) => const FlowerScreen(),

  FavoriteScreen.routeName: (context) => const FavoriteScreen(),

  CartScreen.routeName: (context) => const CartScreen(),

  UserProfile.routeName: (context) => const UserProfile(),
};
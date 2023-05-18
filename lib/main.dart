import 'package:flora/routes.dart';
import 'package:flora/screens/splash/splash_screen.dart';
import 'package:flora/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/cart_provider.dart';
import 'components/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get kTextColor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flora App',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

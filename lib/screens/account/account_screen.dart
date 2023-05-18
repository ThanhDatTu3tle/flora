import 'package:flutter/material.dart';
import 'package:flora/screens/account/components/body.dart';

import '../../constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(

      ),
    );
  }
}

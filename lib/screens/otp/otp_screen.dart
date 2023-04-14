import 'package:flutter/material.dart';

import '../otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "XÁC THỰC MÃ OTP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Body(),
    );
  }
}

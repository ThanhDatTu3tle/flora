import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class FormErrorPassword extends StatelessWidget {
  const FormErrorPassword({
    super.key, required this.passwordErrors,
  });

  final List<String> passwordErrors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        passwordErrors.length, (index) => formErrorPasswordText(passwordErrors: passwordErrors[index]),
      ),
    );
  }

  Row formErrorPasswordText({required String passwordErrors}) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          passwordErrors,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: kWarningColor,
          ),
        )
      ],
    );
  }
}
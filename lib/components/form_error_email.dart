import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class FormErrorEmail extends StatelessWidget {
  const FormErrorEmail({
    super.key, required this.emailErrors,
  });

  final List<String> emailErrors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          emailErrors.length, (index) => formErrorEmailText(emailErrors: emailErrors[index]),
      ),
    );
  }

  Row formErrorEmailText({required String emailErrors}) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
            emailErrors,
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
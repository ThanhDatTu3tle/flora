import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class FormErrorConformPassword extends StatelessWidget {
  const FormErrorConformPassword({
    super.key, required this.conformPasswordErrors,
  });

  final List<String> conformPasswordErrors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        conformPasswordErrors.length, (index) => formErrorConformPasswordText(conformPasswordErrors: conformPasswordErrors[index]),
      ),
    );
  }

  Row formErrorConformPasswordText({required String conformPasswordErrors}) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          conformPasswordErrors,
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
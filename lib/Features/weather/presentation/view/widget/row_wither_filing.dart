import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomRowWitherFiling extends StatelessWidget {
  const CustomRowWitherFiling({
    super.key,
    required this.feels,
    required this.degree,
  });
  final String feels;
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          feels,
          style: AppStyles.styleRegular8().copyWith(
            color: const Color(0xFF929295),
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 11),
        Text(degree, style: AppStyles.styleMedium12()),
      ],
    );
  }
}

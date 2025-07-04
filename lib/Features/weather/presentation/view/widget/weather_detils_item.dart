import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomWeatherDetailsItem extends StatelessWidget {
  const CustomWeatherDetailsItem({
    super.key,
    required this.image,
    required this.theCondition,
    required this.percentage,
  });
  final String image;
  final String theCondition;
  final String percentage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SvgPicture.asset(image, width: 20, height: 16),
          const SizedBox(width: 16),
          Text(
            theCondition,
            style: AppStyles.styleRegular8().copyWith(
              color: const Color(0xFF9B9EAD),
              fontSize: 12,
            ),
          ),
          Text(percentage, style: AppStyles.styleMedium12()),
        ],
      ),
    );
  }
}

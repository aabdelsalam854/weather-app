import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class WeatherInDayDetailsItem extends StatelessWidget {
  const WeatherInDayDetailsItem({
    super.key,
    required this.time,
    required this.degree,
  });
  final String time;
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 46,
        decoration: const BoxDecoration(
          color: Color(0xFF2F313A),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              time,
              style: AppStyles.styleRegular8().copyWith(
                color: const Color(0xFF9B9EAD),
              ),
            ),
            SvgPicture.asset(Assets.imagesPartlycloudy2, width: 20, height: 16),
            Text("$degree°", style: AppStyles.styleSemiBold12()),
          ],
        ),
      ),
    );
  }
}

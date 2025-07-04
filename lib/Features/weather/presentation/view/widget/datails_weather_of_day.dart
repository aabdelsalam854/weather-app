import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/Features/weather/data/weather_model/hour.dart';
import 'package:weather/Features/weather/presentation/view/widget/row_wither_filing.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/weather_model/current.dart';

class DetailsWeatherOfDay extends StatelessWidget {
  const DetailsWeatherOfDay({
    super.key,
    required this.current,
    required this.hour,
  });
  final Current current;
  final Hour hour;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF232329), Color(0xFF2F313A)],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Details",
              style: AppStyles.styleSemiBold12().copyWith(fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Assets.imagesPartlycloudy2,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    children: [
                      CustomRowWitherFiling(
                        feels: "Feels like",
                        degree: "${current.feelslikeC}°",
                      ),
                      CustomRowWitherFiling(
                        feels: "Humidity",
                        degree: "${current.humidity}°",
                      ),
                      CustomRowWitherFiling(
                        feels: "Visibility",
                        degree: "${current.visKm}°",
                      ),
                      CustomRowWitherFiling(
                        feels: "UV Index",
                        degree: "${current.uv}°",
                      ),
                      CustomRowWitherFiling(
                        feels: "Dew point",
                        degree: "${hour.dewpointC}°",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

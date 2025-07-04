import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:weather/Features/weather/presentation/view/widget/weather_in_day_detils_item.dart';
import 'package:weather/core/utils/app_styles.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../data/weather_model/forecastday.dart';

class ForecastDayItem extends StatelessWidget {
  const ForecastDayItem({
    super.key,
    required this.isShow,
    required this.onTap,
    required this.forecastday,
    required this.index,
  });

  final Forecastday forecastday;
  final int index;

  final bool isShow;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    String dateString = forecastday.date!;
    DateFormat format = DateFormat('yyyy-MM-dd');
    DateTime date = format.parse(dateString);
    String dayName = DateFormat('EEEE').format(date);

    return isShow
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF313237),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: Color(0xFF9EA7AE),
                        ),
                        const SizedBox(width: 8),
                        Text(dayName, style: AppStyles.styleMedium12()),
                        Center(
                          child: SvgPicture.asset(Assets.imagesPartlycloudy2),
                        ),
                        const SizedBox(width: 80),
                        Text(
                          "${forecastday.day!.maxtempC}°",
                          style: AppStyles.styleSemiBold12(),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          "${forecastday.day!.mintempC}°",
                          style: AppStyles.styleSemiBold12(),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10 / 3.6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateFormat(
                        'yyyy-MM-dd HH:mm',
                      ).parse(forecastday.hour![index].time!);
                      TimeOfDay time = TimeOfDay.fromDateTime(dateTime);

                      return WeatherInDayDetailsItem(
                        time: time.format(context).toString(),
                        degree: forecastday.hour![index].tempC.toString(),
                      );
                    },
                    itemCount: forecastday.hour!.length,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Color(0xFF9EA7AE),
                  ),
                  const SizedBox(width: 8),
                  Text(dayName, style: AppStyles.styleMedium12()),
                  const Spacer(),
                  Center(child: SvgPicture.asset(Assets.imagesPartlycloudy2)),
                  const SizedBox(width: 80),
                  Text(
                    "${forecastday.day!.maxtempC}°",
                    style: AppStyles.styleSemiBold12(),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "${forecastday.day!.mintempC}°",
                    style: AppStyles.styleSemiBold12(),
                  ),
                ],
              ),
            ),
          );
  }
}

// ExceptionTile

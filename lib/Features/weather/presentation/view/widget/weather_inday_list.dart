import 'package:flutter/material.dart';
import 'package:weather/Features/weather/data/weather_model/forecastday.dart';
import 'package:weather/Features/weather/presentation/view/widget/weather_in_day_detils_item.dart';
import 'package:weather/core/utils/function/function.dart';

class WeatherInDayList extends StatelessWidget {
  const WeatherInDayList({super.key, required this.forecastday});
  final List<Forecastday> forecastday;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 10 / 3.6,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: forecastday[0].hour!.length,
          itemBuilder: (context, index) {
            final hour = forecastday[0].hour![index];

            return WeatherInDayDetailsItem(
              time: parseTime(hour.time!),
              degree: hour.tempC!.toString(),
            );
          },
        ),
      ),
    );
  }
}

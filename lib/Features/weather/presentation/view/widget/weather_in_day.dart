import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/Features/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/Features/weather/presentation/view/widget/air_quality.dart';
import 'package:weather/Features/weather/presentation/view/widget/datails_weather_of_day.dart';
import 'package:weather/Features/weather/presentation/view/widget/forecast_day_list.dart';
import 'package:weather/Features/weather/presentation/view/widget/sun_and_moon_of_day.dart';
import 'package:weather/Features/weather/presentation/view/widget/weather_detils_item.dart';
import 'package:weather/Features/weather/presentation/view/widget/weather_inday_list.dart';
import 'package:weather/core/utils/app_images.dart';
import 'package:weather/core/utils/app_styles.dart';
import 'package:weather/core/utils/function/function.dart';

class WeatherInDay extends StatefulWidget {
  const WeatherInDay({super.key});

  @override
  State<WeatherInDay> createState() => _WeatherInDayState();
}

class _WeatherInDayState extends State<WeatherInDay> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccessState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF32333E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                            bottom: 6,
                            left: 16,
                            right: 17,
                          ),
                          child: Text(
                            parseDate(state.weatherModel.location!.localtime!),
                            style: AppStyles.styleRegular8().copyWith(
                              color: const Color(0xFF9B9EAD),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Oval.svg",
                              width: 120,
                              height: 95,
                            ),
                            const SizedBox(width: 40),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.weatherModel.current!.tempC!.toInt()}°",
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader =
                                          const LinearGradient(
                                            colors: [
                                              Color(0xFFA2A4B5),
                                              Color(0xFF545760),
                                            ],
                                          ).createShader(
                                            const Rect.fromLTWH(
                                              0.0,
                                              0.0,
                                              200.0,
                                              70.0,
                                            ),
                                          ),
                                  ),
                                ),
                                Text(
                                  state.weatherModel.current!.condition!.text!,
                                  style: AppStyles.styleRegular8().copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.weatherModel.forecast!.forecastday![0].day!.maxtempC}/${state.weatherModel.forecast!.forecastday![0].day!.mintempC} | Feels like ${state.weatherModel.current!.feelslikeC}°C",
                              style: AppStyles.styleMedium12(),
                            ),
                            const Spacer(),
                            Container(
                              width: 1,
                              height: 15,
                              color: const Color(0xFF9B9EAD),
                            ),
                            const Spacer(),
                            Text(
                              " Wind ${state.weatherModel.current!.gustKph} KM/H WSW",
                              style: AppStyles.styleMedium12(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const DottedLine(
                        direction: Axis.horizontal,
                        dashColor: Color(0xFF979797),
                        dashGapRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomWeatherDetailsItem(
                            image: Assets.imagesPartlycloudy2,
                            theCondition: "Precipitation:",
                            percentage:
                                "${state.weatherModel.forecast!.forecastday![0].day!.totalprecipIn}%",
                          ),
                          const Spacer(),
                          CustomWeatherDetailsItem(
                            image: "assets/images/rain.svg",
                            theCondition: "Humidity:",
                            percentage:
                                " ${state.weatherModel.current!.humidity}%",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomWeatherDetailsItem(
                            image: "assets/images/wind-icon.svg",
                            theCondition: "Wind:",
                            percentage:
                                "${state.weatherModel.current!.windKph} KM",
                          ),
                          const Spacer(),
                          CustomWeatherDetailsItem(
                            image: Assets.imagesMoon,
                            theCondition: "Sunset:",
                            percentage:
                                " ${state.weatherModel.forecast!.forecastday![0].astro!.sunset}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              WeatherInDayList(
                forecastday: state.weatherModel.forecast!.forecastday!,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 27)),
              ForecastDaysList(
                isShowMapNotifier: ValueNotifier<Map<int, bool>>({}),
                forecastday: state.weatherModel.forecast!.forecastday!,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 18)),
              DetailsWeatherOfDay(
                hour: state.weatherModel.forecast!.forecastday![0].hour![0],
                current: state.weatherModel.current!,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 18)),
              const CustomAirQuality(percentage: 50),
              const SliverToBoxAdapter(child: SizedBox(height: 18)),
              SunAndMoonOfDayWidget(
                forecastday: state.weatherModel.forecast!.forecastday![0],
              ),
            ],
          );
        } else if (state is WeatherErrorState) {
          return Center(child: Text(state.err));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }
}

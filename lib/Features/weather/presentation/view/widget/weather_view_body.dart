import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Features/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/Features/weather/presentation/view/widget/custom_app_bar.dart';
import 'package:weather/Features/weather/presentation/view/widget/search_view.dart';
import 'package:weather/Features/weather/presentation/view/widget/weather_in_day.dart';
import 'package:weather/core/widget/custom_contaner.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF484B5B),
        statusBarIconBrightness: Brightness.light,
      ),
      child: CustomContainer(
        child: SafeArea(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherSuccessState) {
                return Column(
                  children: [
                    CustomAppBar(
                      text:
                          " ${state.weatherModel.location!.name},${state.weatherModel.location!.country} ",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    const Expanded(child: WeatherInDay()),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

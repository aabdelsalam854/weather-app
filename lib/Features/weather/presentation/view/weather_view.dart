import 'package:flutter/material.dart';
import 'package:weather/Features/weather/presentation/view/widget/weather_view_body.dart';
import 'package:weather/core/widget/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WeatherViewBody(), drawer: CustomDrawer());
  }
}

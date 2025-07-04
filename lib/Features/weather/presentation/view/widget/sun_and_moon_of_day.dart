import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/core/utils/app_styles.dart';

import '../../../data/weather_model/forecastday.dart';

class SunAndMoonOfDayWidget extends StatelessWidget {
  const SunAndMoonOfDayWidget({super.key, required this.forecastday});
  final Forecastday forecastday;
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
            const Text(
              "Sun & Moon ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      forecastday.astro!.sunrise!,
                      style: AppStyles.styleMedium12(),
                    ),
                    Text("Sunrise ", style: AppStyles.styleMedium12()),
                  ],
                ),
                const SizedBox(
                  height: 150,
                  width: 150,
                  child: SunAnimationScreen(),
                ),
                Column(
                  children: [
                    Text(
                      forecastday.astro!.sunset!,
                      style: AppStyles.styleMedium12(),
                    ),
                    Text("sunset ", style: AppStyles.styleMedium12()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SunAnimationScreen extends StatefulWidget {
  const SunAnimationScreen({super.key});

  @override
  SunAnimationScreenState createState() => SunAnimationScreenState();
}

class SunAnimationScreenState extends State<SunAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: SunPainter(_controller));
  }
}

class SunPainter extends CustomPainter {
  final Animation<double> animation;

  SunPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint sunPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const double radius = 20.0;

    final double orbitRadius = size.width / 2 - radius;

    final double angle = 3.1415927 + 3.1415927 * animation.value;

    final double sunX = centerX + orbitRadius * cos(angle);
    final double sunY = centerY + orbitRadius * sin(angle);

    canvas.drawCircle(Offset(sunX, sunY), radius, sunPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

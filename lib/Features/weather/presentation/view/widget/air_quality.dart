import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomAirQuality extends StatelessWidget {
  final double percentage;

  const CustomAirQuality({super.key, required this.percentage});

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
              "Air Quality",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.6,
                  height: 92.8,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        radiusFactor: 1.5,
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 30,
                            color: percentage >= 0 && percentage <= 100
                                ? Colors.green
                                : const Color(0xFF48494E),
                            startWidth: 0.2,
                            endWidth: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 60,
                            color: percentage > 30 && percentage <= 100
                                ? Colors.yellow
                                : const Color(0xFF48494E),
                            startWidth: 0.2,
                            endWidth: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                          ),
                          GaugeRange(
                            startValue: 60,
                            endValue: 100,
                            color: percentage > 60 && percentage <= 100
                                ? Colors.red
                                : const Color(0xFF48494E),
                            startWidth: 0.2,
                            endWidth: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0.5,
                            angle: 90,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '31',
                                  style: AppStyles.styleSemiBold25().copyWith(
                                    color: Colors.white,
                                    fontSize: 33,
                                  ),
                                ),
                                Text(
                                  'Moderate',
                                  style: AppStyles.styleRegular8(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "You have good air quality \n enjoy your outdoor activities.",
                  style: AppStyles.styleRegular8(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/Features/weather/data/weather_model/forecastday.dart';
import 'package:weather/Features/weather/presentation/view/widget/forecast_day_item.dart';

class ForecastDaysList extends StatelessWidget {
  const ForecastDaysList({
    super.key,
    required this.forecastday,
    required this.isShowMapNotifier,
  });

  final List<Forecastday> forecastday;
  final ValueNotifier<Map<int, bool>> isShowMapNotifier;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("High", style: TextStyle(color: Color(0xFF919194))),
                    SizedBox(width: 30),
                    Text("Low", style: TextStyle(color: Color(0xFF919194))),
                  ],
                ),
              ),
              ValueListenableBuilder<Map<int, bool>>(
                valueListenable: isShowMapNotifier,
                builder: (context, isShow, _) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: forecastday.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ForecastDayItem(
                          index: index,
                          forecastday: forecastday[index],
                          isShow: isShow[index] ?? false,
                          onTap: () {
                            isShow[index] = !(isShow[index] ?? false);
                            isShowMapNotifier.notifyListeners();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

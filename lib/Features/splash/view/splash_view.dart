import 'package:flutter/material.dart';
import 'package:weather/Features/weather/presentation/view/selict_city.dart';
import 'package:weather/Features/weather/presentation/view/weather_view.dart';
import 'package:weather/core/utils/app_styles.dart';
import 'package:weather/core/utils/service/get_location.dart';
import 'package:geolocator/geolocator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with WidgetsBindingObserver {
  bool isWaitingForSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    navigateToHome();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && isWaitingForSettings) {
      isWaitingForSettings = false;
      navigateToHome();
    }
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isWaitingForSettings = true;

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("خدمة الموقع مغلقة"),
          content: const Text("من فضلك فعّل خدمة الموقع (GPS) من الإعدادات."),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await Geolocator.openLocationSettings();
              },
              child: const Text("موافق"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectCityScreen(),
                  ),
                );
              },
              child: const Text("إلغاء"),
            ),
          ],
        ),
      );

      return;
    }

    try {
      await determinePosition();
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/Group 13.png"),
              Text(
                "Weather",
                style: AppStyles.styleSemiBold25().copyWith(fontSize: 40),
              ),
              Text(
                "Forecast",
                style: AppStyles.styleRegular8().copyWith(
                  color: const Color(0xFF8B95A2),
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

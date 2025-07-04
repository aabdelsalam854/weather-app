import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Features/weather/presentation/view/selict_city.dart';
import 'package:weather/core/constant/cached_key.dart';

import 'package:weather/core/constant/constant.dart';
import 'package:weather/core/utils/local/shared_preferences.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text("خدمة الموقع مغلقة"),
        content: const Text("من فضلك فعّل خدمة الموقع (GPS) من الإعدادات."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();

              await Geolocator.openLocationSettings();

              await Future.delayed(const Duration(seconds: 1));

              bool isEnabled = await Geolocator.isLocationServiceEnabled();

              if (isEnabled) {
                Position position = await Geolocator.getCurrentPosition();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectCityScreen(),
                  ),
                );
              }
            },
            child: const Text("موافق"),
          ),
        ],
      ),
    );

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    log("Service Enabled: $serviceEnabled");
    if (!serviceEnabled) {
      return Future.error('Location services are still disabled.');
    }
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  Position position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
      timeLimit: Duration(seconds: 5),
    ),
  );
  CacheData.setData(
    key: CachedKey.cachedCity,
    value: "${position.latitude},${position.longitude}",
  );

  return position;
}

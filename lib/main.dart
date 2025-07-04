import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Features/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/Features/splash/view/splash_view.dart';
import 'package:weather/core/constant/cached_key.dart';
import 'package:weather/core/constant/constant.dart';
import 'package:weather/core/constant/bloc_observer.dart';
import 'package:weather/core/utils/local/shared_preferences.dart';

void main() async {
  const MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  city = CacheData.getData(key: CachedKey.cachedCity) ?? "cairo";
  // lang = CacheData.getData(key: "lang") ?? "en";

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(cityName: city),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kAppColor),
          fontFamily: "Poppins",
        ),
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

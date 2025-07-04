import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Features/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/core/constant/cached_key.dart';
import 'package:weather/core/utils/local/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late final List<String> cityName;
  @override
  void initState() {
    cityName = CacheData.getData(key: CachedKey.cachedListCity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2F313A), Color(0xFF232329)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          // padding: EdgeInsets.all(18),
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: (Colors.black12)),
                child: Text(
                  'Weather App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.09,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Location      ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.09,
                      ),
                    ),
                    const TextSpan(
                      text: '|',
                      style: TextStyle(
                        color: Color(0xFF707174),
                        fontSize: 16,

                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.09,
                      ),
                    ),
                    const TextSpan(
                      text: '     ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,

                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.09,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Edit',
                      style: const TextStyle(
                        color: Color(0xFF04DDF2),
                        fontSize: 14,

                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ...List.generate(
              cityName.length,
              (index) => ListTile(
                leading: const Icon(Icons.location_on, color: Colors.white),

                title: Text(
                  cityName[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,

                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Your current location',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.read<WeatherCubit>().getWeather(
                    cityName: cityName[index],
                  );
                },
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                  fontWeight: FontWeight.w600,
                ),
              ),

              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: const Text(
                'Help & Feedback',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                // Handle help tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

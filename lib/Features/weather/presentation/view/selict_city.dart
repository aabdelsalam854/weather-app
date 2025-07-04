import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Features/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/Features/weather/presentation/view/weather_view.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  final TextEditingController _controller = TextEditingController();
  String? selectedCity;

  final List<String> cities = [
    'Cairo',
    'Alexandria',
    'Dubai',
    'Riyadh',
    'London',
    'New York',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232329),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/Group 13.png", height: 100),
                    const SizedBox(height: 16),
                    const Text(
                      "Welcome to Weather App",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Select your city to get started",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.grey[900],
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF2F313A),
                        hintText: 'Choose a city',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(),
                      ),
                      items: cities
                          .map(
                            (city) => DropdownMenuItem<String>(
                              value: city,
                              child: Text(
                                city,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: selectedCity == null
                    ? null
                    : () {
                        context.read<WeatherCubit>().getWeather(
                          cityName: selectedCity!,
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

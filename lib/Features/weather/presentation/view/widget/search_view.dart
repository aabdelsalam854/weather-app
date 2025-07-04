import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widget/custom_contaner.dart';

import '../../manager/cubit/weather_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedCity;

  final List<String> egyptianCities = const [
    'القاهرة',
    'الجيزة',
    'الإسكندرية',
    'السويس',
    'طنطا',
    'المنصورة',
    'الزقازيق',
    'دمنهور',
    'أسيوط',
    'سوهاج',
    'قنا',
    'الأقصر',
    'أسوان',
    'بنها',
    'شبين الكوم',
    'كفر الشيخ',
    'العريش',
    'مرسى مطروح',
    'دمياط',
    'بني سويف',
    'الفيوم',
    'المنيا',
    'مرسى مطروح',
    'الواحات البحرية',
    'العين السخنة',
    'شرم الشيخ',
    'الغردقة',
    'نويبع',
    'طابا',
    'دهب',
    'رأس سدر',
    'إسنا',
    'إدفو',
    'العاشر من رمضان',
    'العبور',
    'السادات',
    'الشيخ زايد',
    'القناطر الخيرية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Search City', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintText: 'Enter City name',
                      hintStyle: TextStyle(color: Colors.white54),
                      suffixIcon: Icon(Icons.search),
                      label: Text('Search'),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) async {
                      BlocProvider.of<WeatherCubit>(
                        context,
                      ).getWeather(cityName: value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(egyptianCities.length, (index) {
                    final city = egyptianCities[index];
                    final isSelected = selectedCity == city;

                    return ChoiceChip(
                      label: Text(
                        city,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Colors.blueGrey,
                      backgroundColor: Colors.grey[200],
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCity = selected ? city : null;
                        });

                        if (selected) {
                          BlocProvider.of<WeatherCubit>(
                            context,
                          ).getWeather(cityName: city);
                          Navigator.pop(context);
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

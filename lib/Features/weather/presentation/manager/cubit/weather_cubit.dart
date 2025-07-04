import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/utils/service/api_service.dart';
import '../../../data/weather_model/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      WeatherModel weatherModel = await ApiService(
        Dio(),
      ).getDataFromWeatherApi(cityName: cityName);
      emit(WeatherSuccessState(weatherModel));
    } on Exception catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}

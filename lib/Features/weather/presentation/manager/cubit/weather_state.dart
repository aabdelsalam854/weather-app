part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}

final class WeatherErrorState extends WeatherState {
  final String err;

  WeatherErrorState(this.err);
}

import 'package:dio/dio.dart';
import 'package:weather/Features/weather/data/weather_model/weather_model.dart';
import 'package:weather/core/constant/constant.dart';
import 'package:weather/core/utils/local/shared_preferences.dart';

class ApiService {
  final Dio _dio;
  final String _apiKey = "";

  ApiService(this._dio);

  Future<WeatherModel> getDataFromWeatherApi({required String cityName}) async {
    try {
      var response = await _dio.get(
        "$baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=5&aqi=yes&alerts=yes&lang=ar",
      );

      if (response.data != null) {
        CacheData.addCity(response.data['location']['name']);

        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('No data available');
      }
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['error']['message'] ?? e.toString();
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

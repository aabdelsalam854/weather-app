import 'alerts.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  WeatherModel({this.location, this.current, this.forecast, this.alerts});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    current: json['current'] == null
        ? null
        : Current.fromJson(json['current'] as Map<String, dynamic>),
    forecast: json['forecast'] == null
        ? null
        : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    alerts: json['alerts'] == null
        ? null
        : Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
  );
}

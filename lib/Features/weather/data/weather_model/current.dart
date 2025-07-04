import 'air_quality.dart';
import 'condition.dart';

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  num? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  AirQuality? airQuality;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json['last_updated_epoch'] as int?,
    lastUpdated: json['last_updated'] as String?,
    tempC: json['temp_c'] as double?,
    isDay: json['is_day'] as int?,
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    windMph: (json['wind_mph'] as num?)?.toDouble(),
    windKph: (json['wind_kph'] as num?)?.toDouble(),
    windDegree: json['wind_degree'] as int?,
    windDir: json['wind_dir'] as String?,
    pressureMb: json['pressure_mb'] as double?,
    pressureIn: (json['pressure_in'] as num?)?.toDouble(),
    precipMm: json['precip_mm'] as double?,
    precipIn: json['precip_in'] as num?,
    humidity: json['humidity'] as int?,
    cloud: json['cloud'] as int?,
    feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
    feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
    visKm: json['vis_km'] as double?,
    visMiles: json['vis_miles'] as double?,
    uv: json['uv'] as double?,
    gustMph: (json['gust_mph'] as num?)?.toDouble(),
    gustKph: (json['gust_kph'] as num?)?.toDouble(),
    airQuality: json['air_quality'] == null
        ? null
        : AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
  );
}

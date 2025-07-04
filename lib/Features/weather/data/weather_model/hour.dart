import 'condition.dart';

class Hour {
  int? timeEpoch;
  String? time;
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
  double? precipIn;
  double? snowCm;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? windchillC;
  double? heatindexC;
  double? dewpointC;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  num? uv;

  Hour({
    this.timeEpoch,
    this.time,
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
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.windchillC,
    this.heatindexC,
    this.dewpointC,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    timeEpoch: json['time_epoch'] as int?,
    time: json['time'] as String?,
    tempC: (json['temp_c'] as num?)?.toDouble(),
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
    precipIn: json['precip_in'] as double?,
    snowCm: json['snow_cm'] as double?,
    humidity: json['humidity'] as int?,
    cloud: json['cloud'] as int?,
    feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
    windchillC: (json['windchill_c'] as num?)?.toDouble(),
    heatindexC: (json['heatindex_c'] as num?)?.toDouble(),
    dewpointC: (json['dewpoint_c'] as num?)?.toDouble(),
    willItRain: json['will_it_rain'] as int?,
    chanceOfRain: json['chance_of_rain'] as int?,
    willItSnow: json['will_it_snow'] as int?,
    chanceOfSnow: json['chance_of_snow'] as int?,
    visKm: json['vis_km'] as double?,
    visMiles: json['vis_miles'] as double?,
    gustMph: json['gust_mph'] as double?,
    gustKph: (json['gust_kph'] as num?)?.toDouble(),
    uv: json['uv'] as num?,
  );
}

import 'condition.dart';

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
    mintempC: json['mintemp_c'] as double?,
    avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
    maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
    maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
    totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
    totalprecipIn: (json['totalprecip_in'] as num?)?.toDouble(),
    totalsnowCm: json['totalsnow_cm'] as double?,
    avgvisKm: (json['avgvis_km'] as num?)?.toDouble(),
    avgvisMiles: json['avgvis_miles'] as double?,
    avghumidity: json['avghumidity'] as int?,
    dailyWillItRain: json['daily_will_it_rain'] as int?,
    dailyChanceOfRain: json['daily_chance_of_rain'] as int?,
    dailyWillItSnow: json['daily_will_it_snow'] as int?,
    dailyChanceOfSnow: json['daily_chance_of_snow'] as int?,
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    uv: json['uv'] as double?,
  );
}

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
    co: (json['co'] as num?)?.toDouble(),
    no2: (json['no2'] as num?)?.toDouble(),
    o3: (json['o3'] as num?)?.toDouble(),
    so2: (json['so2'] as num?)?.toDouble(),
    pm25: (json['pm2_5'] as num?)?.toDouble(),
    pm10: (json['pm10'] as num?)?.toDouble(),
    usEpaIndex: json['us-epa-index'] as int?,
    gbDefraIndex: json['gb-defra-index'] as int?,
  );
}

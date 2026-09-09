class HourlyWeatherModel {
  final DateTime time;
  final String icone;
  final double hourlyTemp;

  HourlyWeatherModel(
      {required this.time, required this.icone, required this.hourlyTemp});

  factory HourlyWeatherModel.fromJson(json) {
    return HourlyWeatherModel(
      time: DateTime.parse(json['time']),
      icone: json['condition']['icon'],
      hourlyTemp: json['temp_c'],
    );
  }
}

import 'package:weather_app/Models/hourly_weather_model.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int humidity;
  final double wind;
  final double visibility;
  final double uv;
  final List<HourlyWeatherModel> hourlyWeather;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.humidity,
    required this.wind,
    required this.visibility,
    required this.uv,
    required this.hourlyWeather,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      visibility: json['forecast']['forecastday'][0]['day']['avgvis_km'],
      uv: json['forecast']['forecastday'][0]['day']['uv'],
      hourlyWeather: json['forecast']['forecastday'][0]['hour']
          .map<HourlyWeatherModel>((element) {
        return HourlyWeatherModel.fromJson(element);
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      weatherModel.cityName,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }
}

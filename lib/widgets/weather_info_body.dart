import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/components/Custom_hourly_forecast_card.dart';
import 'package:weather_app/components/Custom_weather_card.dart';
import 'package:weather_app/components/Custom_weather_details_card.dart';

import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: SizedBox(
          width: double.infinity,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1800),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                getThemeColor(weatherModel.weatherCondition),
                getThemeColor(weatherModel.weatherCondition)[300]!,
                getThemeColor(weatherModel.weatherCondition)[50]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Column(
                children: [
                  CustomWeatherCard(weatherModel: weatherModel),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomWeatherDetailsCard(weatherModel: weatherModel),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomHourlyForecastCard(weatherModel: weatherModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

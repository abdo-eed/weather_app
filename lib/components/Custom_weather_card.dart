import 'package:flutter/material.dart';
import 'package:weather_app/components/Custom_text.dart';
import 'package:weather_app/Models/weather_model.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 300,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 5)),
        ]),
        child: Card(
          color: Colors.white.withAlpha(0),
          surfaceTintColor: Colors.white.withAlpha(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(weatherModel: weatherModel),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${weatherModel.temp.round().toString()}°',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Image.network(
                  "https:${weatherModel.image}",
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weatherModel.weatherCondition,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '.at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H: ${weatherModel.maxTemp.round()}°',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'L: ${weatherModel.minTemp.round()}°',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

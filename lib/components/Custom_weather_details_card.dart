import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';

class CustomWeatherDetailsCard extends StatelessWidget {
  const CustomWeatherDetailsCard({Key? key, required this.weatherModel})
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'WEATHER DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.water_drop,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Humidity: ${weatherModel.humidity} %',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.air,
                    size: 30,
                    color: Color(0xFF90A4AE),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Wind : ${weatherModel.wind.round()} kph',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.visibility,
                    size: 30,
                    color: Color(0xFF5D4037),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Visibility: ${weatherModel.visibility.round()} km',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.wb_sunny_outlined,
                    size: 30,
                    color: Color(0xFFFFB300),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'UV : ${weatherModel.uv}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

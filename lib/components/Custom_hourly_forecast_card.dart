import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:intl/intl.dart';

class CustomHourlyForecastCard extends StatelessWidget {
  const CustomHourlyForecastCard({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    final currentHourIndex = weatherModel.hourlyWeather.indexWhere(
      (element) => element.time.hour == DateTime.now().hour,
    );
    return Container(
      width: 330,
      height: 200,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 5)),
      ]),
      child: Card(
        color: Colors.white.withAlpha(0),
        surfaceTintColor: Colors.white.withAlpha(0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'HOURLY FORECAST',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: weatherModel.hourlyWeather.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SizedBox(
                          width: 90,
                          height: 100,
                          child: Card(
                            color: Colors.white.withAlpha(40),
                            surfaceTintColor: Colors.white.withAlpha(0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  index == 0
                                      ? 'Now'
                                      : DateFormat('h a').format(
                                          weatherModel
                                              .hourlyWeather[
                                                  (currentHourIndex + index) %
                                                      weatherModel
                                                          .hourlyWeather.length]
                                              .time,
                                        ),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Image.network(
                                  "https:${weatherModel.hourlyWeather[(currentHourIndex + index) % weatherModel.hourlyWeather.length].icone}",
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${weatherModel.hourlyWeather[(currentHourIndex + index) % weatherModel.hourlyWeather.length].hourlyTemp.round()}°',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

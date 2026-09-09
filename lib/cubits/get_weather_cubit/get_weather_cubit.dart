import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Servies/weather_servies.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather%20states.dart';

class GetWeatherCubit extends Cubit <WeatherState>
{
  GetWeatherCubit() : super(WeatherInitialState());
 WeatherModel? weatherModel;

getWeather({required String cityName})async{

   try {
   weatherModel= await WeatherServies(Dio())
           .getCurrentWeather(cityName: cityName);
  
   emit(WeatherLoadedState(weatherModel: weatherModel!));

} catch (e) {
  
  emit(WeatherFailureState(

    e.toString(),
  ));
}

}



}
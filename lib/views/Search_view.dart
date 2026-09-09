

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
   title: const Text('Search City'),

    ),
    body:Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
        onSubmitted: (value)async
         {
         var getweathercubit= BlocProvider.of<GetWeatherCubit>(context);
         getweathercubit.getWeather(cityName:value);
          Navigator.pop(context);
         },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal:16,
            vertical: 32 
            ),
          hintText: 'Enter city name',
          
          labelText: 'search',
          suffixIcon:  Icon(Icons.search),

        border: OutlineInputBorder(
        
          ),
        
        
        
        ),
        
        
        
        
        ),
      ),
    ),













    );
  }
}

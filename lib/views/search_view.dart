import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_task/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
              var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,horizontal: 16
              ),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
WeatherModel? weatherModel;

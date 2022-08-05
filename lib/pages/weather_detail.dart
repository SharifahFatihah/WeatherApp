import 'package:day10/states/weather_cubit.dart';
import 'package:day10/states/weather_state.dart';
import 'package:day10/widgets/weather_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
      ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather detail'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fmd_bad, size:40),
                  Text(
                      state is WeatherError ? state.errorMessage: 'Unknown error',
                      style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
        },
        ),
      ),
    );
  }
}

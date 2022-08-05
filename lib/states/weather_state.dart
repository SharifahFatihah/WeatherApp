// 4 kind of states
// 1 = initialize
// 2 = loading
// 3 = loaded data from api
// 4 = error, something wrong is happening in the backend

import 'package:day10/models/weather_model.dart';


abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError ({required this.errorMessage});
}
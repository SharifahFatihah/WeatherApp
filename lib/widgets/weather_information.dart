import 'package:day10/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({
    required this.weatherModel,
    Key? key
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                // const SizedBox(height: 10, width: 400),
                Icon(Icons.location_on),
                Text('${weatherModel.name}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10, width: 400),
            Image.network(
              'http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}.png',
              width: 100,
              // height: 50,
              fit: BoxFit.contain,
            ),
            // Icon(Icons.wb_sunny, color: Colors.yellow, size: 100),
            const SizedBox(height: 10, width: 400),
            Text('${weatherModel.main.temp}°C',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 10, width: 400),
            Text('${weatherModel.weather.first.description}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10, width: 400),
            Text('Feels like ${weatherModel.main.feelsLike}°C',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10, width: 400),
            Text('Pressure: ${weatherModel.main.pressure} mBar',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10, width: 400),
            Text('Humidity: ${weatherModel.main.humidity}%',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:day10/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = 'bdc721147bdce4e4f74e44c449d4fa5d';
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather information');
    }
  }
}
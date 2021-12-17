import 'package:app10/provider/settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/open_weather.dart';
import '../api/api_key.dart';

class Network {
  Future<OpenWeather> getOpenWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=${ApiKey.OPEN_WEATHER_API}'));
    //print(response.body);
    if (response.statusCode == 200) {
      SettingsManager.changeCity(city);
      return OpenWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}

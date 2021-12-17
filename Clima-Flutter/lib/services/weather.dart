import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

    Location _location = Location();
    Networking _networking;

  final String apiKey = '516688bbd84235a94c74857965be9adc';
  final String siteUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    await _location.getCurrentLocation();
    print('---------------- Weather API ----------------');
    _networking = Networking(url: '$siteUrl?lat=${_location.latitude}&lon=${_location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await _networking.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async { 
    print('---------------- City Weather API ----------------');
    _networking = Networking(url: '$siteUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await _networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

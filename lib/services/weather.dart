import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = 'ac24fb7c5855d6ab446944b697bc4587';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weather = await networkHelper.getData();
    return weather;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
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
      return '🍦 დროა';
    } else if (temp > 20) {
      return 'შეგიძლიათ გაშიშვლდეთ :))) 👕';
    } else if (temp < 10) {
      return 'არ დაგავიწყდეს 🧣 და 🧤';
    } else {
      return 'თან იქონიე 🧥';
    }
  }
}

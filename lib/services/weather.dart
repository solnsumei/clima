import '../services/location.dart';
import '../services/networking.dart';

const apiKey = "daa4aa18856687e7fc429a43c5934680";
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    final url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';

    return NetworkHelper(url).getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    if (location.latitude != null) {
      NetworkHelper networkHelper = NetworkHelper(
          "$openWeatherMapUrl?lat=${location
              .latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

      return networkHelper.getData();
    }
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

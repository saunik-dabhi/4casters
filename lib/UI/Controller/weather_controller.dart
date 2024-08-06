import 'package:forecasters/Helper/app_constants.dart';
import 'package:get/get.dart';

import '../../Model/weather.dart';

class WeatherController extends GetxController {
  Rx<Weather> weather = Weather(
    timelines: Timelines(minutely: [], hourly: [], daily: []),
    location: Location(lat: 0, lon: 0),
  ).obs;
  RxString city = ''.obs;

  Map<int, String> weatherCodeInterpreter = {
    0: "Unknown",
    1000: "Clear, Sunny",
    1100: "Mostly Clear",
    1101: "Partly Cloudy",
    1102: "Mostly Cloudy",
    1001: "Cloudy",
    2000: "Fog",
    2100: "Light Fog",
    4000: "Drizzle",
    4001: "Rain",
    4200: "Light Rain",
    4201: "Heavy Rain",
    5000: "Snow",
    5001: "Flurries",
    5100: "Light Snow",
    5101: "Heavy Snow",
    6000: "Freezing Drizzle",
    6001: "Freezing Rain",
    6200: "Light Freezing Rain",
    6201: "Heavy Freezing Rain",
    7000: "Ice Pellets",
    7101: "Heavy Ice Pellets",
    7102: "Light Ice Pellets",
    8000: "Thunderstorm"
  };

  final backgroundWeatherImage = {
    0: [AppConstants.imgSunny, AppConstants.imgSunnyBg],
    1000: [AppConstants.imgSunny, AppConstants.imgSunnyBg],
    1100: [AppConstants.imgSunny, AppConstants.imgSunnyBg],
    1101: [AppConstants.imgCloudy, AppConstants.imgCloudyBg],
    1001: [AppConstants.imgCloudy, AppConstants.imgCloudyBg],
    1102: [AppConstants.imgCloudy, AppConstants.imgCloudyBg],
    2000: [AppConstants.imgCloudy, AppConstants.imgCloudyBg],
    2100: [AppConstants.imgCloudy, AppConstants.imgCloudyBg],
    4000: [AppConstants.imgHeavyRain, AppConstants.imgRainyBg],
    4001: [AppConstants.imgHeavyRain, AppConstants.imgRainyBg],
    4200: [AppConstants.imgHeavyRain, AppConstants.imgRainyBg],
    4201: [AppConstants.imgHeavyRain, AppConstants.imgRainyBg],
    5000: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    5001: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    5100: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    5101: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    6000: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    6001: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    6200: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    6201: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    7000: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    7101: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    7102: [AppConstants.imgSnow, AppConstants.imgSnowBg],
    8000: [AppConstants.imgSnow, AppConstants.imgSnowBg]
  };
}

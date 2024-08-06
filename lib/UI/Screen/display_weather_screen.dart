import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/Model/favorite.dart';
import 'package:forecasters/UI/Controller/favorite_controller.dart';
import 'package:forecasters/UI/Controller/locale_controller.dart';
import 'package:forecasters/UI/Controller/weather_controller.dart';
import 'package:forecasters/UI/Screen/splash_screen.dart';
import 'package:forecasters/UI/Widget/display_weather_cards.dart';
import 'package:forecasters/UI/Widget/weather_prediction.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DisplayWeatherScreen extends StatefulWidget {
  const DisplayWeatherScreen({super.key});

  @override
  State<DisplayWeatherScreen> createState() => _DisplayWeatherScreenState();
}

class _DisplayWeatherScreenState extends State<DisplayWeatherScreen> {
  final WeatherController weatherController = Get.find();

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const ImageIcon(AssetImage(AppConstants.imgDoubleLeft)),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.off(() => const SplashScreen());
            },
            icon: const ImageIcon(AssetImage(AppConstants.imgLogout)),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '4casters',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: weatherController.weather.value.timelines.hourly.isEmpty
          ? const SizedBox.shrink()
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(weatherController.backgroundWeatherImage[
                          weatherController.weather.value.timelines.daily[0]
                              .values.weatherCodeMax]?[1] ??
                      ''),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: GetBuilder<LocaleController>(
                  builder: (context) {
                    return Column(
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(
                          weatherController.backgroundWeatherImage[weatherController
                                  .weather
                                  .value
                                  .timelines
                                  .daily[0]
                                  .values
                                  .weatherCodeMax]?[0] ??
                              '',
                          height: 106,
                          width: 135,
                        ),
                        Center(
                          child: Text(
                            weatherController.city.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Text(
                            '${weatherController.weatherCodeInterpreter[weatherController.weather.value.timelines.daily[0].values.weatherCodeMax ?? 0]}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        const SizedBox(height: 25),
                        weatherController.weather.value.timelines.hourly.isEmpty
                            ? const SizedBox.shrink()
                            : Text(
                                '${weatherController.weather.value.timelines.hourly[0].values.temperature?.toInt()}\u00B0C',
                                style: const TextStyle(fontSize: 40),
                              ),
                        Text(
                          '${AppConstants.feelsLike.tr} ${weatherController.weather.value.timelines.hourly[0].values.temperatureApparent?.toInt()}\u00B0C',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Container(
                          height: 130,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: weatherController
                                  .weather.value.timelines.daily.length,
                              itemBuilder: (context, index) {
                                final list =
                                    weatherController.weather.value.timelines.daily;
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == list.length - 1 ? 0 : 50,
                                  ),
                                  child: WeatherPrediction(
                                    lowestTemp:
                                        list[index].values.temperatureMin ?? 0,
                                    highestTemp:
                                        list[index].values.temperatureMax ?? 0,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            DisplayWeatherCard(
                              title: AppConstants.wind.tr,
                              subtitle: AppConstants.windText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.windSpeedAvg?.toInt()}km/hr',
                              imgPath: AppConstants.imgWindTurbines,
                            ),
                            DisplayWeatherCard(
                              title: AppConstants.rain.tr,
                              subtitle: AppConstants.rainText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.precipitationProbabilityAvg?.toInt()}%',
                              imgPath: AppConstants.imgRainSensor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DisplayWeatherCard(
                              title: AppConstants.pressure.tr,
                              subtitle: AppConstants.pressureText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.pressureSurfaceLevelAvg} hpa',
                              imgPath: AppConstants.imgAtPressure,
                            ),
                            DisplayWeatherCard(
                              title: AppConstants.uvIndex.tr,
                              subtitle: AppConstants.uvIndexText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.uvIndexAvg}',
                              imgPath: AppConstants.imgSunlight,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DisplayWeatherCard(
                              title: AppConstants.humidity.tr,
                              subtitle: AppConstants.humidityText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.humidityAvg}%',
                              imgPath: AppConstants.imgHeavyRain,
                            ),
                            DisplayWeatherCard(
                              title: AppConstants.visibility.tr,
                              subtitle: AppConstants.visibilityText.tr,
                              value:
                                  '${weatherController.weather.value.timelines.daily[0].values.visibilityAvg} km',
                              imgPath: AppConstants.imgSunny,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DisplayWeatherCard(
                              title: AppConstants.sunrise.tr,
                              subtitle: AppConstants.sunriseText.tr,
                              value: DateFormat.jm().format(weatherController
                                      .weather
                                      .value
                                      .timelines
                                      .daily[0]
                                      .values
                                      .sunriseTime ??
                                  DateTime.now()),
                              imgPath: AppConstants.imgSunrise,
                            ),
                            DisplayWeatherCard(
                              title: AppConstants.sunset.tr,
                              subtitle: AppConstants.sunsetText.tr,
                              value: DateFormat.jm().format(weatherController
                                      .weather
                                      .value
                                      .timelines
                                      .daily[0]
                                      .values
                                      .sunsetTime ??
                                  DateTime.now()),
                              imgPath: AppConstants.imgSunset,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (favoriteController.favorites.isEmpty) {
            favoriteController.favorites.add(Favorite(
              lat: weatherController.weather.value.location.lat,
              long: weatherController.weather.value.location.lon,
              isFavorite: true,
            ));
            favoriteController.update();
          }
          if (favoriteController
                  .favorites[favoriteController.favorites.length - 1].lat ==
              weatherController.weather.value.location.lat) {
            favoriteController
                    .favorites[favoriteController.favorites.length - 1]
                    .isFavorite =
                !favoriteController
                    .favorites[favoriteController.favorites.length - 1]
                    .isFavorite;
          }
          favoriteController.update();
          setState(() {});
        },
        child: favoriteController.favorites.isEmpty
            ? const Icon(Icons.favorite_border)
            : favoriteController
                    .favorites[favoriteController.favorites.length - 1]
                    .isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/Model/places.dart';
import 'package:forecasters/UI/Controller/locale_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/weather.dart';
import '../Controller/search_controller.dart' as s;
import '../Controller/weather_controller.dart';
import '../Widget/search_card.dart';
import 'display_weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WeatherController weatherController = Get.put(WeatherController());
  final s.SearchController searchController = Get.put(s.SearchController());
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppConstants.grBgGradient,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          controller: searchTextController,
                          style: const TextStyle(
                            color: AppConstants.clrBlueTint,
                            fontSize: 20,
                          ),
                          onSubmitted: (str) {
                            if (str.isEmpty || str.isNum) {
                              searchTextController.clear();
                              return;
                            }
                            http
                                .post(Uri.parse(AppConstants.placeSearchUrl),
                                    headers: {
                                      "Content-Type": "application/json",
                                      "X-Goog-FieldMask":
                                          "places.displayName,places.location",
                                      "X-Goog-Api-Key": AppConstants.mapsApiKey
                                    },
                                    body: jsonEncode({
                                      "textQuery": searchTextController.text
                                    }))
                                .then((value) {
                              searchController.place.value =
                                  placesFromJson(value.body);
                              searchController.update();
                              setState(() {});
                            });
                            searchTextController.clear();
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          searchTextController.clear();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppConstants.clrBlueTint,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GetBuilder<LocaleController>(
              builder: (context) {
                return Text(
                  AppConstants.recentSearches.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.white),
            ),
            if (searchController.place.value.places.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                  itemCount: searchController.place.value.places.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      var place = searchController.place.value.places[index];
                      var location =
                          searchController.place.value.places[index].location;
                      var url =
                          '${AppConstants.baseUrl}${location.latitude}, ${location.latitude}${AppConstants.apiKey}';
                      http.get(Uri.parse(url)).then((value) {
                        weatherController.city.value = place.displayName.text;
                        weatherController.weather.value =
                            weatherFromJson(value.body);
                        weatherController.update();
                        Future.delayed(const Duration(seconds: 1));
                        setState(() {});
                        Get.to(() => const DisplayWeatherScreen());
                      });
                    },
                    child: SearchCard(
                      title: searchController
                          .place.value.places[index].displayName.text,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

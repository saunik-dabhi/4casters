import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/UI/Controller/locale_controller.dart';
import 'package:get/get.dart';

class WeatherPrediction extends StatelessWidget {
  const WeatherPrediction({
    super.key,
    required this.lowestTemp,
    required this.highestTemp,
  });

  final double lowestTemp, highestTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$lowestTemp\u00B0C',
          style: const TextStyle(fontSize: 14),
        ),
        GetBuilder<LocaleController>(
          builder: (context) {
            return Text(
              AppConstants.low.tr,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            );
          }
        ),
        const SizedBox(height: 25),
        Text(
          '$highestTemp\u00B0C',
          style: const TextStyle(fontSize: 14),
        ),
        GetBuilder<LocaleController>(
          builder: (context) {
            return Text(
              AppConstants.high.tr,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            );
          }
        ),
      ],
    );
  }
}

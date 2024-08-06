import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/UI/Controller/locale_controller.dart';
import 'package:forecasters/UI/Controller/weather_controller.dart';
import 'package:forecasters/UI/Screen/search_screen.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final WeatherController weatherController = Get.put(WeatherController());
  final LocaleController localeController = Get.put(LocaleController());

  @override
  void initState() {
    super.initState();
    getWeatherData();
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppConstants.grBgGradient,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 200),
            Center(
              child: Image.asset(
                AppConstants.imgLogo,
                height: 90,
                width: 90,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '4caster',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            GetBuilder<LocaleController>(
              builder: (context) => Text(
                AppConstants.weatherApp.tr,
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 130),
            GestureDetector(
              onTap: () {
                setState(() {});
                getWeatherData();
                Future.delayed(const Duration(seconds: 1));
                Get.to(() => const SearchScreen());
              },
              child: Center(
                child: Image.asset(AppConstants.imgNext, height: 72),
              ),
            ),
            const SizedBox(height: 20),
            // GetBuilder<LocaleController>(
            //   builder: (context) {
            //     return ElevatedButton(
            //       onPressed: () {
            //         localeController.changeLocale();
            //         localeController.update();
            //         setState(() {});
            //       },
            //       child: Text(
            //         AppConstants.changeLanguage.tr,
            //         style: const TextStyle(fontSize: 20),
            //       ),
            //     );
            //   }
            // ),
          ],
        ),
      ),
    );
  }
}

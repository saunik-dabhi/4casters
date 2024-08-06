import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/Helper/translate.dart';
import 'package:forecasters/UI/Screen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '4Casters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      locale: AppConstants.english,
      fallbackLocale: AppConstants.english,
      supportedLocales: const [
        AppConstants.english,
        AppConstants.french,
      ],
      translations: Translate(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

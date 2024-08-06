import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/app_constants.dart';

class LocaleController extends GetxController {
  Rx<Locale> locale = AppConstants.english.obs;

  void changeLocale() {
    if (locale.value == AppConstants.english) {
      locale.value = AppConstants.french;
    } else {
      locale.value = AppConstants.english;
    }
  }
}

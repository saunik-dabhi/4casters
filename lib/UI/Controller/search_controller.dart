import 'package:get/get.dart';

import '../../Model/places.dart';

class SearchController extends GetxController {
  Rx<Places> place = Places(places: []).obs;
}

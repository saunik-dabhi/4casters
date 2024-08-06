import 'package:flutter/material.dart';

class AppConstants {
  static const String imgBasePath = 'assets/image';
  static const String imgLogo = '$imgBasePath/Climate_Care.png';
  static const String imgNext = '$imgBasePath/Next_page.png';
  static const String imgDoubleLeft = '$imgBasePath/Double_Left.png';
  static const String imgLogout = '$imgBasePath/Logout.png';
  static const String imgAtPressure = '$imgBasePath/Atmospheric_Pressure.png';
  static const String imgRainSensor = '$imgBasePath/Rain_Sensor.png';
  static const String imgSunlight = '$imgBasePath/Sunlight.png';
  static const String imgWindTurbines = '$imgBasePath/Wind_Turbines.png';
  static const String imgCloudy = '$imgBasePath/cloudy.png';
  static const String imgSunny = '$imgBasePath/Sun.png';
  static const String imgSnow = '$imgBasePath/Snow.png';
  static const String imgHeavyRain = '$imgBasePath/Heavy Rain.png';
  static const String imgSnowBg = '$imgBasePath/snow_bg.png';
  static const String imgRainyBg = '$imgBasePath/rainy_bg.png';
  static const String imgSunnyBg = '$imgBasePath/sunny_bg.png';
  static const String imgCloudyBg = '$imgBasePath/cloudy_bg.png';
  static const String imgSunrise = '$imgBasePath/sunrise.png';
  static const String imgSunset = '$imgBasePath/sunset.png';

  static const Color clrNeptuneBlue = Color(0xFF70A4AF);
  static const Color clrBlueTint = Color(0xFF034347);

  static const Gradient grBgGradient = LinearGradient(
    colors: [AppConstants.clrNeptuneBlue, AppConstants.clrBlueTint],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const String baseUrl =
      'https://api.tomorrow.io/v4/weather/forecast?location=';
  static const String apiKey = '&apikey=2WDjvQhforSF50mHbi6Ud3xC1qS2o0Lk';
  static const String mapsApiKey = 'AIzaSyCXiM_WwJQRjQ-0b2OVUBs1vZzTPp_c9A4';
  static const String placeSearchUrl =
      'https://places.googleapis.com/v1/places:searchText';

  static const String weatherApp = 'weatherApp';
  static const String recentSearches = 'recentSearches';
  static const String wind = 'wind';
  static const String windText = 'windText';
  static const String rain = 'rain';
  static const String rainText = 'rainText';
  static const String pressure = 'pressure';
  static const String pressureText = 'pressureText';
  static const String uvIndex = 'uvIndex';
  static const String uvIndexText = 'uvIndexText';
  static const String humidity = 'humidity';
  static const String humidityText = 'humidityText';
  static const String visibility = 'visibility';
  static const String visibilityText = 'visibilityText';
  static const String sunrise = 'sunrise';
  static const String sunriseText = 'sunriseText';
  static const String sunset = 'sunset';
  static const String sunsetText = 'sunsetText';
  static const String high = 'high';
  static const String low = 'low';
  static const String feelsLike = 'feelsLike';
  static const String changeLanguage = 'changeLanguage';

  static const Locale english = Locale('en','US');
  static const Locale french = Locale('fr','FR');
}

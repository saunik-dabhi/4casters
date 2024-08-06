import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  final Timelines timelines;
  final Location location;

  Weather({
    required this.timelines,
    required this.location,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        timelines: Timelines.fromJson(json["timelines"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "timelines": timelines.toJson(),
        "location": location.toJson(),
      };
}

class Location {
  final double lat;
  final double lon;

  Location({
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Timelines {
  final List<Hourly> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;

  Timelines({
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
        minutely:
            List<Hourly>.from(json["minutely"].map((x) => Hourly.fromJson(x))),
        hourly:
            List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "minutely": List<dynamic>.from(minutely.map((x) => x.toJson())),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Daily {
  final DateTime time;
  final Values values;

  Daily({
    required this.time,
    required this.values,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: DateTime.parse(json["time"]),
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "values": values.toJson(),
      };
}

class Values {
  final double? cloudBaseAvg;
  final double? cloudBaseMax;
  final int? cloudBaseMin;
  final double? cloudCeilingAvg;
  final double? cloudCeilingMax;
  final double? cloudCeilingMin;
  final double? cloudCoverAvg;
  final double? cloudCoverMax;
  final double? cloudCoverMin;
  final double? dewPointAvg;
  final double? dewPointMax;
  final double? dewPointMin;
  final double? evapotranspirationAvg;
  final double? evapotranspirationMax;
  final double? evapotranspirationMin;
  final double? evapotranspirationSum;
  final int? freezingRainIntensityAvg;
  final int? freezingRainIntensityMax;
  final int? freezingRainIntensityMin;
  final double? humidityAvg;
  final double? humidityMax;
  final double? humidityMin;
  final int? iceAccumulationAvg;
  final int? iceAccumulationLweAvg;
  final int? iceAccumulationLweMax;
  final int? iceAccumulationLweMin;
  final int? iceAccumulationLweSum;
  final int? iceAccumulationMax;
  final int? iceAccumulationMin;
  final int? iceAccumulationSum;
  final DateTime? moonriseTime;
  final DateTime? moonsetTime;
  final double? precipitationProbabilityAvg;
  final int? precipitationProbabilityMax;
  final int? precipitationProbabilityMin;
  final double? pressureSurfaceLevelAvg;
  final double? pressureSurfaceLevelMax;
  final double? pressureSurfaceLevelMin;
  final double? rainAccumulationAvg;
  final double? rainAccumulationLweAvg;
  final double? rainAccumulationLweMax;
  final int? rainAccumulationLweMin;
  final double? rainAccumulationMax;
  final int? rainAccumulationMin;
  final double? rainAccumulationSum;
  final double? rainIntensityAvg;
  final double? rainIntensityMax;
  final double? rainIntensityMin;
  final int? sleetAccumulationAvg;
  final int? sleetAccumulationLweAvg;
  final int? sleetAccumulationLweMax;
  final int? sleetAccumulationLweMin;
  final int? sleetAccumulationLweSum;
  final int? sleetAccumulationMax;
  final int? sleetAccumulationMin;
  final int? sleetIntensityAvg;
  final int? sleetIntensityMax;
  final int? sleetIntensityMin;
  final int? snowAccumulationAvg;
  final int? snowAccumulationLweAvg;
  final int? snowAccumulationLweMax;
  final int? snowAccumulationLweMin;
  final int? snowAccumulationLweSum;
  final int? snowAccumulationMax;
  final int? snowAccumulationMin;
  final int? snowAccumulationSum;
  final int? snowDepthAvg;
  final int? snowDepthMax;
  final int? snowDepthMin;
  final int? snowDepthSum;
  final int? snowIntensityAvg;
  final int? snowIntensityMax;
  final int? snowIntensityMin;
  final DateTime? sunriseTime;
  final DateTime? sunsetTime;
  final double? temperatureApparentAvg;
  final double? temperatureApparentMax;
  final double? temperatureApparentMin;
  final double? temperatureAvg;
  final double? temperatureMax;
  final double? temperatureMin;
  final int? uvHealthConcernAvg;
  final int? uvHealthConcernMax;
  final int? uvHealthConcernMin;
  final int? uvIndexAvg;
  final int? uvIndexMax;
  final int? uvIndexMin;
  final double? visibilityAvg;
  final double? visibilityMax;
  final double? visibilityMin;
  final int? weatherCodeMax;
  final int? weatherCodeMin;
  final double? windDirectionAvg;
  final double? windGustAvg;
  final double? windGustMax;
  final double? windGustMin;
  final double? windSpeedAvg;
  final double? windSpeedMax;
  final double? windSpeedMin;

  Values({
    this.cloudBaseAvg,
    this.cloudBaseMax,
    this.cloudBaseMin,
    this.cloudCeilingAvg,
    this.cloudCeilingMax,
    this.cloudCeilingMin,
    this.cloudCoverAvg,
    this.cloudCoverMax,
    this.cloudCoverMin,
    this.dewPointAvg,
    this.dewPointMax,
    this.dewPointMin,
    this.evapotranspirationAvg,
    this.evapotranspirationMax,
    this.evapotranspirationMin,
    this.evapotranspirationSum,
    this.freezingRainIntensityAvg,
    this.freezingRainIntensityMax,
    this.freezingRainIntensityMin,
    this.humidityAvg,
    this.humidityMax,
    this.humidityMin,
    this.iceAccumulationAvg,
    this.iceAccumulationLweAvg,
    this.iceAccumulationLweMax,
    this.iceAccumulationLweMin,
    this.iceAccumulationLweSum,
    this.iceAccumulationMax,
    this.iceAccumulationMin,
    this.iceAccumulationSum,
    this.moonriseTime,
    this.moonsetTime,
    this.precipitationProbabilityAvg,
    this.precipitationProbabilityMax,
    this.precipitationProbabilityMin,
    this.pressureSurfaceLevelAvg,
    this.pressureSurfaceLevelMax,
    this.pressureSurfaceLevelMin,
    this.rainAccumulationAvg,
    this.rainAccumulationLweAvg,
    this.rainAccumulationLweMax,
    this.rainAccumulationLweMin,
    this.rainAccumulationMax,
    this.rainAccumulationMin,
    this.rainAccumulationSum,
    this.rainIntensityAvg,
    this.rainIntensityMax,
    this.rainIntensityMin,
    this.sleetAccumulationAvg,
    this.sleetAccumulationLweAvg,
    this.sleetAccumulationLweMax,
    this.sleetAccumulationLweMin,
    this.sleetAccumulationLweSum,
    this.sleetAccumulationMax,
    this.sleetAccumulationMin,
    this.sleetIntensityAvg,
    this.sleetIntensityMax,
    this.sleetIntensityMin,
    this.snowAccumulationAvg,
    this.snowAccumulationLweAvg,
    this.snowAccumulationLweMax,
    this.snowAccumulationLweMin,
    this.snowAccumulationLweSum,
    this.snowAccumulationMax,
    this.snowAccumulationMin,
    this.snowAccumulationSum,
    this.snowDepthAvg,
    this.snowDepthMax,
    this.snowDepthMin,
    this.snowDepthSum,
    this.snowIntensityAvg,
    this.snowIntensityMax,
    this.snowIntensityMin,
    this.sunriseTime,
    this.sunsetTime,
    this.temperatureApparentAvg,
    this.temperatureApparentMax,
    this.temperatureApparentMin,
    this.temperatureAvg,
    this.temperatureMax,
    this.temperatureMin,
    this.uvHealthConcernAvg,
    this.uvHealthConcernMax,
    this.uvHealthConcernMin,
    this.uvIndexAvg,
    this.uvIndexMax,
    this.uvIndexMin,
    this.visibilityAvg,
    this.visibilityMax,
    this.visibilityMin,
    this.weatherCodeMax,
    this.weatherCodeMin,
    this.windDirectionAvg,
    this.windGustAvg,
    this.windGustMax,
    this.windGustMin,
    this.windSpeedAvg,
    this.windSpeedMax,
    this.windSpeedMin,
  });

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        cloudBaseAvg: json["cloudBaseAvg"]?.toDouble(),
        cloudBaseMax: json["cloudBaseMax"]?.toDouble(),
        cloudBaseMin: json["cloudBaseMin"]?.toInt(),
        cloudCeilingAvg: json["cloudCeilingAvg"]?.toDouble(),
        cloudCeilingMax: json["cloudCeilingMax"]?.toDouble(),
        cloudCeilingMin: json["cloudCeilingMin"]?.toDouble(),
        cloudCoverAvg: json["cloudCoverAvg"]?.toDouble(),
        cloudCoverMax: json["cloudCoverMax"]?.toDouble(),
        cloudCoverMin: json["cloudCoverMin"]?.toDouble(),
        dewPointAvg: json["dewPointAvg"]?.toDouble(),
        dewPointMax: json["dewPointMax"]?.toDouble(),
        dewPointMin: json["dewPointMin"]?.toDouble(),
        evapotranspirationAvg: json["evapotranspirationAvg"]?.toDouble(),
        evapotranspirationMax: json["evapotranspirationMax"]?.toDouble(),
        evapotranspirationMin: json["evapotranspirationMin"]?.toDouble(),
        evapotranspirationSum: json["evapotranspirationSum"]?.toDouble(),
        freezingRainIntensityAvg: json["freezingRainIntensityAvg"],
        freezingRainIntensityMax: json["freezingRainIntensityMax"],
        freezingRainIntensityMin: json["freezingRainIntensityMin"],
        humidityAvg: json["humidityAvg"]?.toDouble(),
        humidityMax: json["humidityMax"]?.toDouble(),
        humidityMin: json["humidityMin"]?.toDouble(),
        iceAccumulationAvg: json["iceAccumulationAvg"],
        iceAccumulationLweAvg: json["iceAccumulationLweAvg"],
        iceAccumulationLweMax: json["iceAccumulationLweMax"],
        iceAccumulationLweMin: json["iceAccumulationLweMin"],
        iceAccumulationLweSum: json["iceAccumulationLweSum"],
        iceAccumulationMax: json["iceAccumulationMax"],
        iceAccumulationMin: json["iceAccumulationMin"],
        iceAccumulationSum: json["iceAccumulationSum"],
        moonriseTime: json["moonriseTime"] == null
            ? DateTime(2024, 6, 17)
            : DateTime.parse(json["moonriseTime"]),
        moonsetTime: json["moonsetTime"] == null
            ? DateTime(2024, 6, 17)
            : DateTime.parse(json["moonsetTime"]),
        precipitationProbabilityAvg:
            json["precipitationProbabilityAvg"]?.toDouble(),
        precipitationProbabilityMax: json["precipitationProbabilityMax"],
        precipitationProbabilityMin: json["precipitationProbabilityMin"],
        pressureSurfaceLevelAvg: json["pressureSurfaceLevelAvg"]?.toDouble(),
        pressureSurfaceLevelMax: json["pressureSurfaceLevelMax"]?.toDouble(),
        pressureSurfaceLevelMin: json["pressureSurfaceLevelMin"]?.toDouble(),
        rainAccumulationAvg: json["rainAccumulationAvg"]?.toDouble(),
        rainAccumulationLweAvg: json["rainAccumulationLweAvg"]?.toDouble(),
        rainAccumulationLweMax: json["rainAccumulationLweMax"]?.toDouble(),
        rainAccumulationLweMin: json["rainAccumulationLweMin"],
        rainAccumulationMax: json["rainAccumulationMax"]?.toDouble(),
        rainAccumulationMin: json["rainAccumulationMin"],
        rainAccumulationSum: json["rainAccumulationSum"]?.toDouble(),
        rainIntensityAvg: json["rainIntensityAvg"]?.toDouble(),
        rainIntensityMax: json["rainIntensityMax"]?.toDouble(),
        rainIntensityMin: json["rainIntensityMin"]?.toDouble(),
        sleetAccumulationAvg: json["sleetAccumulationAvg"],
        sleetAccumulationLweAvg: json["sleetAccumulationLweAvg"],
        sleetAccumulationLweMax: json["sleetAccumulationLweMax"],
        sleetAccumulationLweMin: json["sleetAccumulationLweMin"],
        sleetAccumulationLweSum: json["sleetAccumulationLweSum"],
        sleetAccumulationMax: json["sleetAccumulationMax"],
        sleetAccumulationMin: json["sleetAccumulationMin"],
        sleetIntensityAvg: json["sleetIntensityAvg"],
        sleetIntensityMax: json["sleetIntensityMax"],
        sleetIntensityMin: json["sleetIntensityMin"],
        snowAccumulationAvg: json["snowAccumulationAvg"],
        snowAccumulationLweAvg: json["snowAccumulationLweAvg"],
        snowAccumulationLweMax: json["snowAccumulationLweMax"],
        snowAccumulationLweMin: json["snowAccumulationLweMin"],
        snowAccumulationLweSum: json["snowAccumulationLweSum"],
        snowAccumulationMax: json["snowAccumulationMax"],
        snowAccumulationMin: json["snowAccumulationMin"],
        snowAccumulationSum: json["snowAccumulationSum"],
        snowDepthAvg: json["snowDepthAvg"],
        snowDepthMax: json["snowDepthMax"],
        snowDepthMin: json["snowDepthMin"],
        snowDepthSum: json["snowDepthSum"],
        snowIntensityAvg: json["snowIntensityAvg"],
        snowIntensityMax: json["snowIntensityMax"],
        snowIntensityMin: json["snowIntensityMin"],
        sunriseTime: json["sunriseTime"] == null
            ? DateTime(2024)
            : DateTime.parse(json["sunriseTime"]),
        sunsetTime: json["sunsetTime"] == null
            ? DateTime(2024)
            : DateTime.parse(json["sunsetTime"]),
        temperatureApparentAvg: json["temperatureApparentAvg"]?.toDouble(),
        temperatureApparentMax: json["temperatureApparentMax"]?.toDouble(),
        temperatureApparentMin: json["temperatureApparentMin"]?.toDouble(),
        temperatureAvg: json["temperatureAvg"]?.toDouble(),
        temperatureMax: json["temperatureMax"]?.toDouble(),
        temperatureMin: json["temperatureMin"]?.toDouble(),
        uvHealthConcernAvg: json["uvHealthConcernAvg"],
        uvHealthConcernMax: json["uvHealthConcernMax"],
        uvHealthConcernMin: json["uvHealthConcernMin"],
        uvIndexAvg: json["uvIndexAvg"],
        uvIndexMax: json["uvIndexMax"],
        uvIndexMin: json["uvIndexMin"],
        visibilityAvg: json["visibilityAvg"]?.toDouble(),
        visibilityMax: json["visibilityMax"]?.toDouble(),
        visibilityMin: json["visibilityMin"]?.toDouble(),
        weatherCodeMax: json["weatherCodeMax"],
        weatherCodeMin: json["weatherCodeMin"],
        windDirectionAvg: json["windDirectionAvg"]?.toDouble(),
        windGustAvg: json["windGustAvg"]?.toDouble(),
        windGustMax: json["windGustMax"]?.toDouble(),
        windGustMin: json["windGustMin"]?.toDouble(),
        windSpeedAvg: json["windSpeedAvg"]?.toDouble(),
        windSpeedMax: json["windSpeedMax"]?.toDouble(),
        windSpeedMin: json["windSpeedMin"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cloudBaseAvg": cloudBaseAvg,
        "cloudBaseMax": cloudBaseMax,
        "cloudBaseMin": cloudBaseMin,
        "cloudCeilingAvg": cloudCeilingAvg,
        "cloudCeilingMax": cloudCeilingMax,
        "cloudCeilingMin": cloudCeilingMin,
        "cloudCoverAvg": cloudCoverAvg,
        "cloudCoverMax": cloudCoverMax,
        "cloudCoverMin": cloudCoverMin,
        "dewPointAvg": dewPointAvg,
        "dewPointMax": dewPointMax,
        "dewPointMin": dewPointMin,
        "evapotranspirationAvg": evapotranspirationAvg,
        "evapotranspirationMax": evapotranspirationMax,
        "evapotranspirationMin": evapotranspirationMin,
        "evapotranspirationSum": evapotranspirationSum,
        "freezingRainIntensityAvg": freezingRainIntensityAvg,
        "freezingRainIntensityMax": freezingRainIntensityMax,
        "freezingRainIntensityMin": freezingRainIntensityMin,
        "humidityAvg": humidityAvg,
        "humidityMax": humidityMax,
        "humidityMin": humidityMin,
        "iceAccumulationAvg": iceAccumulationAvg,
        "iceAccumulationLweAvg": iceAccumulationLweAvg,
        "iceAccumulationLweMax": iceAccumulationLweMax,
        "iceAccumulationLweMin": iceAccumulationLweMin,
        "iceAccumulationLweSum": iceAccumulationLweSum,
        "iceAccumulationMax": iceAccumulationMax,
        "iceAccumulationMin": iceAccumulationMin,
        "iceAccumulationSum": iceAccumulationSum,
        "moonriseTime": moonriseTime?.toIso8601String(),
        "moonsetTime": moonsetTime?.toIso8601String(),
        "precipitationProbabilityAvg": precipitationProbabilityAvg,
        "precipitationProbabilityMax": precipitationProbabilityMax,
        "precipitationProbabilityMin": precipitationProbabilityMin,
        "pressureSurfaceLevelAvg": pressureSurfaceLevelAvg,
        "pressureSurfaceLevelMax": pressureSurfaceLevelMax,
        "pressureSurfaceLevelMin": pressureSurfaceLevelMin,
        "rainAccumulationAvg": rainAccumulationAvg,
        "rainAccumulationLweAvg": rainAccumulationLweAvg,
        "rainAccumulationLweMax": rainAccumulationLweMax,
        "rainAccumulationLweMin": rainAccumulationLweMin,
        "rainAccumulationMax": rainAccumulationMax,
        "rainAccumulationMin": rainAccumulationMin,
        "rainAccumulationSum": rainAccumulationSum,
        "rainIntensityAvg": rainIntensityAvg,
        "rainIntensityMax": rainIntensityMax,
        "rainIntensityMin": rainIntensityMin,
        "sleetAccumulationAvg": sleetAccumulationAvg,
        "sleetAccumulationLweAvg": sleetAccumulationLweAvg,
        "sleetAccumulationLweMax": sleetAccumulationLweMax,
        "sleetAccumulationLweMin": sleetAccumulationLweMin,
        "sleetAccumulationLweSum": sleetAccumulationLweSum,
        "sleetAccumulationMax": sleetAccumulationMax,
        "sleetAccumulationMin": sleetAccumulationMin,
        "sleetIntensityAvg": sleetIntensityAvg,
        "sleetIntensityMax": sleetIntensityMax,
        "sleetIntensityMin": sleetIntensityMin,
        "snowAccumulationAvg": snowAccumulationAvg,
        "snowAccumulationLweAvg": snowAccumulationLweAvg,
        "snowAccumulationLweMax": snowAccumulationLweMax,
        "snowAccumulationLweMin": snowAccumulationLweMin,
        "snowAccumulationLweSum": snowAccumulationLweSum,
        "snowAccumulationMax": snowAccumulationMax,
        "snowAccumulationMin": snowAccumulationMin,
        "snowAccumulationSum": snowAccumulationSum,
        "snowDepthAvg": snowDepthAvg,
        "snowDepthMax": snowDepthMax,
        "snowDepthMin": snowDepthMin,
        "snowDepthSum": snowDepthSum,
        "snowIntensityAvg": snowIntensityAvg,
        "snowIntensityMax": snowIntensityMax,
        "snowIntensityMin": snowIntensityMin,
        "sunriseTime": sunriseTime?.toIso8601String(),
        "sunsetTime": sunsetTime?.toIso8601String(),
        "temperatureApparentAvg": temperatureApparentAvg,
        "temperatureApparentMax": temperatureApparentMax,
        "temperatureApparentMin": temperatureApparentMin,
        "temperatureAvg": temperatureAvg,
        "temperatureMax": temperatureMax,
        "temperatureMin": temperatureMin,
        "uvHealthConcernAvg": uvHealthConcernAvg,
        "uvHealthConcernMax": uvHealthConcernMax,
        "uvHealthConcernMin": uvHealthConcernMin,
        "uvIndexAvg": uvIndexAvg,
        "uvIndexMax": uvIndexMax,
        "uvIndexMin": uvIndexMin,
        "visibilityAvg": visibilityAvg,
        "visibilityMax": visibilityMax,
        "visibilityMin": visibilityMin,
        "weatherCodeMax": weatherCodeMax,
        "weatherCodeMin": weatherCodeMin,
        "windDirectionAvg": windDirectionAvg,
        "windGustAvg": windGustAvg,
        "windGustMax": windGustMax,
        "windGustMin": windGustMin,
        "windSpeedAvg": windSpeedAvg,
        "windSpeedMax": windSpeedMax,
        "windSpeedMin": windSpeedMin,
      };
}

class Hourly {
  final DateTime time;
  final HourlyValues values;

  Hourly({
    required this.time,
    required this.values,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: DateTime.parse(json["time"]),
        values: HourlyValues.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "values": values.toJson(),
      };
}

class HourlyValues {
  final double? cloudBase;
  final double? cloudCeiling;
  final double? cloudCover;
  final double? dewPoint;
  final double? evapotranspiration;
  final int? freezingRainIntensity;
  final double? humidity;
  final int? iceAccumulation;
  final int? iceAccumulationLwe;
  final double? precipitationProbability;
  final double? pressureSurfaceLevel;
  final double? rainAccumulation;
  final double? rainAccumulationLwe;
  final double? rainIntensity;
  final int? sleetAccumulation;
  final int? sleetAccumulationLwe;
  final int? sleetIntensity;
  final int? snowAccumulation;
  final int? snowAccumulationLwe;
  final int? snowDepth;
  final int? snowIntensity;
  final double? temperatureApparent;
  final double? temperature;
  final int? uvHealthConcern;
  final int? uvIndex;
  final double? visibility;
  final int? weatherCode;
  final double? windDirection;
  final double? windGust;
  final double? windSpeed;

  HourlyValues(
      {this.cloudBase,
      this.cloudCeiling,
      this.cloudCover,
      this.dewPoint,
      this.evapotranspiration,
      this.freezingRainIntensity,
      this.humidity,
      this.iceAccumulation,
      this.iceAccumulationLwe,
      this.precipitationProbability,
      this.pressureSurfaceLevel,
      this.rainAccumulation,
      this.rainAccumulationLwe,
      this.rainIntensity,
      this.sleetAccumulation,
      this.sleetAccumulationLwe,
      this.sleetIntensity,
      this.snowAccumulation,
      this.snowAccumulationLwe,
      this.snowDepth,
      this.snowIntensity,
      this.temperatureApparent,
      this.temperature,
      this.uvHealthConcern,
      this.uvIndex,
      this.visibility,
      this.weatherCode,
      this.windDirection,
      this.windGust,
      this.windSpeed});

  factory HourlyValues.fromJson(Map<String, dynamic> json) => HourlyValues(
        cloudBase: json["cloudBase"]?.toDouble(),
        cloudCeiling: json["cloudCeiling"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        evapotranspiration: json["evapotranspiration"]?.toDouble(),
        freezingRainIntensity: json["freezingRainIntensity"],
        humidity: json["humidity"]?.toDouble(),
        iceAccumulation: json["iceAccumulation"],
        iceAccumulationLwe: json["iceAccumulationLwe"],
        precipitationProbability: json["precipitationProbability"]?.toDouble(),
        pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
        rainAccumulation: json["rainAccumulation"]?.toDouble(),
        rainAccumulationLwe: json["rainAccumulationLwe"]?.toDouble(),
        rainIntensity: json["rainIntensity"]?.toDouble(),
        sleetAccumulation: json["sleetAccumulation"],
        sleetAccumulationLwe: json["sleetAccumulationLwe"],
        sleetIntensity: json["sleetIntensity"],
        snowAccumulation: json["snowAccumulation"],
        snowAccumulationLwe: json["snowAccumulationLwe"],
        snowDepth: json["snowDepth"],
        snowIntensity: json["snowIntensity"],
        temperature: json["temperature"]?.toDouble(),
        temperatureApparent: json["temperatureApparent"]?.toDouble(),
        uvHealthConcern: json["uvHealthConcern"],
        uvIndex: json["uvIndex"],
        visibility: json["visibility"]?.toDouble(),
        weatherCode: json["weatherCode"],
        windDirection: json["windDirection"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cloudBase": cloudBase,
        "cloudCeiling": cloudCeiling,
        "cloudCover": cloudCover,
        "dewPoint": dewPoint,
        "evapotranspiration": evapotranspiration,
        "freezingRainIntensity": freezingRainIntensity,
        "humidity": humidity,
        "iceAccumulation": iceAccumulation,
        "iceAccumulationLwe": iceAccumulationLwe,
        "precipitationProbability": precipitationProbability,
        "pressureSurfaceLevel": pressureSurfaceLevel,
        "rainAccumulation": rainAccumulation,
        "rainAccumulationLwe": rainAccumulationLwe,
        "rainIntensity": rainIntensity,
        "sleetAccumulation": sleetAccumulation,
        "sleetAccumulationLwe": sleetAccumulationLwe,
        "sleetIntensity": sleetIntensity,
        "snowAccumulation": snowAccumulation,
        "snowAccumulationLwe": snowAccumulationLwe,
        "snowDepth": snowDepth,
        "snowIntensity": snowIntensity,
        "temperature": temperature,
        "temperatureApparent": temperatureApparent,
        "uvHealthConcern": uvHealthConcern,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "weatherCode": weatherCode,
        "windDirection": windDirection,
        "windGust": windGust,
        "windSpeed": windSpeed,
      };
}

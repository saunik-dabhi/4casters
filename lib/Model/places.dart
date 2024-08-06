import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  final List<Place> places;

  Places({
    required this.places,
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  final Location location;
  final DisplayName displayName;

  Place({
    required this.location,
    required this.displayName,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        location: Location.fromJson(json["location"]),
        displayName: DisplayName.fromJson(json["displayName"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "displayName": displayName.toJson(),
      };
}

class DisplayName {
  final String text;
  final String languageCode;

  DisplayName({
    required this.text,
    required this.languageCode,
  });

  factory DisplayName.fromJson(Map<String, dynamic> json) => DisplayName(
        text: json["text"],
        languageCode: json["languageCode"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "languageCode": languageCode,
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

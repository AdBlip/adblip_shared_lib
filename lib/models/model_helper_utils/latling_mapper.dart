import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngMapper {
  static double toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    throw FormatException('Invalid type for latitude/longitude: $value');
  }

  static LatLng fromMap(Map<String, dynamic> map) {
    return LatLng(
      toDouble(map['latitude']),
      toDouble(map['longitude']),
    );
  }

  static Map<String, dynamic> toMap(LatLng latLng) {
    return {
      'latitude': latLng.latitude,
      'longitude': latLng.longitude,
    };
  }
}

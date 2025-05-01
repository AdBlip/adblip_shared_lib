import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngMapper {
  static double toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    throw FormatException('Invalid type for latitude/longitude: $value');
  }

  static LatLng fromMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return LatLng(
        toDouble(value['latitude']),
        toDouble(value['longitude']),
      );
    } else if (value is List<dynamic>) {
      if (value.length != 2) {
        throw FormatException('Expected [lat, lng], got $value');
      }
      return LatLng(
        toDouble(value[0]),
        toDouble(value[1]),
      );
    }
    throw FormatException('Expected Map or List, got ${value.runtimeType}');
  }

  static Map<String, dynamic> toMap(LatLng latLng) {
    return {
      'latitude': latLng.latitude,
      'longitude': latLng.longitude,
    };
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class BoardLocation {
  double latitude;
  double longitude;
  String id;
  String companyId;
  BoardLocation({
    required this.latitude,
    required this.longitude,
    required this.id,
    required this.companyId,
  });

  BoardLocation copyWith({
    double? latitude,
    double? longitude,
    String? id,
    String? companyId,
  }) {
    return BoardLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'id': id,
      'companyId': companyId,
    };
  }

  factory BoardLocation.fromMap(Map<String, dynamic> map) {
    return BoardLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      id: map['id'] as String,
      companyId: map['companyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardLocation.fromJson(String source) =>
      BoardLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoardLocation(latitude: $latitude, longitude: $longitude, id: $id, companyId: $companyId)';
  }

  @override
  bool operator ==(covariant BoardLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.id == id &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        id.hashCode ^
        companyId.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SearchedPlace {
  String placeId;
  int numberOfSearches;
  String countryNameInEnglish;
  SearchedPlace({
    required this.placeId,
    required this.numberOfSearches,
    required this.countryNameInEnglish,
  });

  SearchedPlace copyWith({
    String? placeId,
    int? numberOfSearches,
    String? countryNameInEnglish,
  }) {
    return SearchedPlace(
      placeId: placeId ?? this.placeId,
      numberOfSearches: numberOfSearches ?? this.numberOfSearches,
      countryNameInEnglish: countryNameInEnglish ?? this.countryNameInEnglish,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'placeId': placeId,
      'numberOfSearches': numberOfSearches,
      'countryNameInEnglish': countryNameInEnglish,
    };
  }

  factory SearchedPlace.fromMap(Map<String, dynamic> map) {
    return SearchedPlace(
      placeId: map['placeId'] as String,
      numberOfSearches: map['numberOfSearches'] as int,
      countryNameInEnglish: map['countryNameInEnglish'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchedPlace.fromJson(String source) =>
      SearchedPlace.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchedPlace(placeId: $placeId, numberOfSearches: $numberOfSearches, countryNameInEnglish: $countryNameInEnglish)';

  @override
  bool operator ==(covariant SearchedPlace other) {
    if (identical(this, other)) return true;

    return other.placeId == placeId &&
        other.numberOfSearches == numberOfSearches &&
        other.countryNameInEnglish == countryNameInEnglish;
  }

  @override
  int get hashCode =>
      placeId.hashCode ^
      numberOfSearches.hashCode ^
      countryNameInEnglish.hashCode;
}

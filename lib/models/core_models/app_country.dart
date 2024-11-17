// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppCountry {
  final String code;
  final String countryName;
  AppCountry({
    required this.code,
    required this.countryName,
  });

  AppCountry copyWith({
    String? code,
    String? countryName,
  }) {
    return AppCountry(
      code: code ?? this.code,
      countryName: countryName ?? this.countryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'countryName': countryName,
    };
  }

  factory AppCountry.fromMap(Map<String, dynamic> map) {
    return AppCountry(
      code: map['code'] as String,
      countryName: map['countryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppCountry.fromJson(String source) => AppCountry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppCountry(code: $code, countryName: $countryName)';

  @override
  bool operator ==(covariant AppCountry other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.countryName == countryName;
  }

  @override
  int get hashCode => code.hashCode ^ countryName.hashCode;
}

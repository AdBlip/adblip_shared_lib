// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppCountry {
  final String code;
  final String name;
  AppCountry({
    required this.code,
    required this.name,
  });

  AppCountry copyWith({
    String? code,
    String? name,
  }) {
    return AppCountry(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory AppCountry.fromMap(Map<String, dynamic> map) {
    return AppCountry(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppCountry.fromJson(String source) => AppCountry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppCountry(code: $code, name: $name)';

  @override
  bool operator ==(covariant AppCountry other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}

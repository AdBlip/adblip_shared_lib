// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ad {
  final String adLink;

  Ad({
    required this.adLink,
  });

  Ad copyWith({
    String? adLink,
  }) {
    return Ad(
      adLink: adLink ?? this.adLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adLink': adLink,
    };
  }

  factory Ad.fromMap(Map<String, dynamic> map) {
    return Ad(
      adLink: map['adLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ad.fromJson(String source) =>
      Ad.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Ad(adLink: $adLink)';

  @override
  bool operator ==(covariant Ad other) {
    if (identical(this, other)) return true;

    return other.adLink == adLink;
  }

  @override
  int get hashCode => adLink.hashCode;
}

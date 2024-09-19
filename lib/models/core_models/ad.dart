// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:adblip_shared_lib/models/helper_models/uploaded_file_data.dart';

class Ad {
  final UploadedFileData adData;

  Ad({
    required this.adData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adData': adData,
    };
  }

  factory Ad.fromMap(Map<String, dynamic> map) {
    return Ad(
      adData: UploadedFileData.fromMap((map['adData'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ad.fromJson(String source) =>
      Ad.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Ad(adData: $adData)';

  @override
  bool operator ==(covariant Ad other) {
    if (identical(this, other)) return true;

    return other.adData == adData;
  }

  @override
  int get hashCode => adData.hashCode;
}

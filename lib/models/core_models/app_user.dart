import 'dart:convert';

import 'package:collection/collection.dart';

import '../helper_models/uploaded_file_data.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  String id;
  String companyName;
  String companyEmail;
  String companyBaseCountry;
  String companyPhoneNumber;
  String companyOperatingCountry;
  String companyOperatingAdministrativeAreaLevel1;
  DateTime joinDate;
  UploadedFileData companyBusinessActivityLicenseImageLink;
  UploadedFileData companyCommercialRegisterImageLink;
  UploadedFileData logoImageLink;
  String preferredLanguage;
  List<String> favouriteBoardsIds;
  List<String> recentSearchedPlaceIds;
  String? fcmToken;
  AppUser(
      {required this.id,
      required this.companyName,
      required this.companyEmail,
      required this.companyBaseCountry,
      required this.companyPhoneNumber,
      required this.companyOperatingCountry,
      required this.companyOperatingAdministrativeAreaLevel1,
      required this.joinDate,
      required this.companyBusinessActivityLicenseImageLink,
      required this.companyCommercialRegisterImageLink,
      required this.logoImageLink,
      required this.preferredLanguage,
      required this.favouriteBoardsIds,
      required this.recentSearchedPlaceIds,
      required this.fcmToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyBaseCountry': companyBaseCountry,
      'companyPhoneNumber': companyPhoneNumber,
      'companyOperatingCountry': companyOperatingCountry,
      'companyOperatingAdministrativeAreaLevel1':
          companyOperatingAdministrativeAreaLevel1,
      'joinDate': joinDate.millisecondsSinceEpoch,
      'companyBusinessActivityLicenseImageLink':
          companyBusinessActivityLicenseImageLink.toMap(),
      'companyCommercialRegisterImageLink':
          companyCommercialRegisterImageLink.toMap(),
      'logoImageLink': logoImageLink.toMap(),
      'preferredLanguage': preferredLanguage,
      'favouriteBoardsIds': favouriteBoardsIds,
      "recentSearchedPlaceIds": recentSearchedPlaceIds,
      "fcmToken": fcmToken,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        id: map['id'] as String,
        companyName: map['companyName'] as String,
        companyEmail: map['companyEmail'] as String,
        companyBaseCountry: map['companyBaseCountry'] as String,
        companyPhoneNumber: map['companyPhoneNumber'] as String,
        companyOperatingCountry: map['companyOperatingCountry'] as String,
        companyOperatingAdministrativeAreaLevel1:
            map['companyOperatingAdministrativeAreaLevel1'] as String,
        joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
        companyBusinessActivityLicenseImageLink: UploadedFileData.fromMap(
            map['companyBusinessActivityLicenseImageLink']
                as Map<String, dynamic>),
        companyCommercialRegisterImageLink: UploadedFileData.fromMap(
            map['companyCommercialRegisterImageLink'] as Map<String, dynamic>),
        logoImageLink: UploadedFileData.fromMap(
            map['logoImageLink'] as Map<String, dynamic>),
        preferredLanguage: map['preferredLanguage'] as String,
        favouriteBoardsIds:
            List<String>.from((map['favouriteBoardsIds'] as List<dynamic>)),
        recentSearchedPlaceIds:
            List<String>.from((map['recentSearchedPlaceIds'] as List<dynamic>)),
        fcmToken: map['fcmToken'] as String?);
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(id: $id, companyName: $companyName, companyEmail: $companyEmail, companyBaseCountry: $companyBaseCountry, companyPhoneNumber: $companyPhoneNumber, companyOperatingCountry: $companyOperatingCountry, companyOperatingAdministrativeAreaLevel1: $companyOperatingAdministrativeAreaLevel1, joinDate: $joinDate, companyBusinessActivityLicenseImageLink: $companyBusinessActivityLicenseImageLink, companyCommercialRegisterImageLink: $companyCommercialRegisterImageLink, logoImageLink: $logoImageLink, preferredLanguage: $preferredLanguage, favouriteBoardsIds: $favouriteBoardsIds)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.companyName == companyName &&
        other.companyEmail == companyEmail &&
        other.companyBaseCountry == companyBaseCountry &&
        other.companyPhoneNumber == companyPhoneNumber &&
        other.companyOperatingCountry == companyOperatingCountry &&
        other.companyOperatingAdministrativeAreaLevel1 ==
            companyOperatingAdministrativeAreaLevel1 &&
        other.joinDate == joinDate &&
        other.companyBusinessActivityLicenseImageLink ==
            companyBusinessActivityLicenseImageLink &&
        other.companyCommercialRegisterImageLink ==
            companyCommercialRegisterImageLink &&
        other.logoImageLink == logoImageLink &&
        other.preferredLanguage == preferredLanguage &&
        listEquals(other.favouriteBoardsIds, favouriteBoardsIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyName.hashCode ^
        companyEmail.hashCode ^
        companyBaseCountry.hashCode ^
        companyPhoneNumber.hashCode ^
        companyOperatingCountry.hashCode ^
        companyOperatingAdministrativeAreaLevel1.hashCode ^
        joinDate.hashCode ^
        companyBusinessActivityLicenseImageLink.hashCode ^
        companyCommercialRegisterImageLink.hashCode ^
        logoImageLink.hashCode ^
        preferredLanguage.hashCode ^
        favouriteBoardsIds.hashCode;
  }
}

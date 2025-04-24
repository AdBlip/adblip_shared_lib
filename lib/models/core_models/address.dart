// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String? street;
  final String? locality;
  final String? country;
  final String? neighborhood;
  final String? buildingNumber;
  final String? postalCode;
  final String? administrativeAreaLevel1;
  final String? administrativeAreaLevel2;
  final String? administrativeAreaLevel3;
  final String? formattedAddress;
  Address({
    this.street,
    this.formattedAddress,
    this.locality,
    this.country,
    this.neighborhood,
    this.buildingNumber,
    this.postalCode,
    this.administrativeAreaLevel1,
    this.administrativeAreaLevel2,
    this.administrativeAreaLevel3,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'locality': locality,
      'country': country,
      'neighborhood': neighborhood,
      'buildingNumber': buildingNumber,
      'postalCode': postalCode,
      'administrativeAreaLevel1': administrativeAreaLevel1,
      'administrativeAreaLevel2': administrativeAreaLevel2,
      'administrativeAreaLevel3': administrativeAreaLevel3,
      "formattedAddress": formattedAddress,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      formattedAddress: map['formattedAddress'] != null
          ? map["formattedAddress"] as String
          : null,
      street: map['street'] != null ? map['street'] as String : null,
      locality: map['locality'] != null ? map['locality'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      neighborhood:
          map['neighborhood'] != null ? map['neighborhood'] as String : null,
      buildingNumber: map['buildingNumber'] != null
          ? map['buildingNumber'] as String
          : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      administrativeAreaLevel1: map['administrativeAreaLevel1'] != null
          ? map['administrativeAreaLevel1'] as String
          : null,
      administrativeAreaLevel2: map['administrativeAreaLevel2'] != null
          ? map['administrativeAreaLevel2'] as String
          : null,
      administrativeAreaLevel3: map['administrativeAreaLevel3'] != null
          ? map['administrativeAreaLevel3'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(street: $street, locality: $locality, country: $country, neighborhood: $neighborhood, buildingNumber: $buildingNumber, postalCode: $postalCode, administrativeAreaLevel1: $administrativeAreaLevel1, administrativeAreaLevel2: $administrativeAreaLevel2, administrativeAreaLevel3: $administrativeAreaLevel3)';
  }

  String toStringNarrowToWide() {
    List<String?> parts = [
      buildingNumber,
      street,
      neighborhood,
      administrativeAreaLevel3,
      administrativeAreaLevel2,
      administrativeAreaLevel1,
      locality,
      country,
    ];

    return parts.where((part) => part?.isNotEmpty == true).join(', ');
  }

  String toStringWideToNarrow() {
    List<String?> parts = [
      country,
      locality,
      administrativeAreaLevel1,
      administrativeAreaLevel2,
      administrativeAreaLevel3,
      neighborhood,
      street,
      buildingNumber,
    ];

    return parts.where((part) => part?.isNotEmpty == true).join(', ');
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.locality == locality &&
        other.country == country &&
        other.neighborhood == neighborhood &&
        other.buildingNumber == buildingNumber &&
        other.postalCode == postalCode &&
        other.administrativeAreaLevel1 == administrativeAreaLevel1 &&
        other.administrativeAreaLevel2 == administrativeAreaLevel2 &&
        other.administrativeAreaLevel3 == administrativeAreaLevel3;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        locality.hashCode ^
        country.hashCode ^
        neighborhood.hashCode ^
        buildingNumber.hashCode ^
        postalCode.hashCode ^
        administrativeAreaLevel1.hashCode ^
        administrativeAreaLevel2.hashCode ^
        administrativeAreaLevel3.hashCode;
  }
factory Address.empty() {
  return Address(
    street: '',
    locality: '',
    country: '',
    neighborhood: '',
    buildingNumber: '',
    postalCode: '',
    administrativeAreaLevel1: '',
    administrativeAreaLevel2: '',
    administrativeAreaLevel3: '',
    formattedAddress: '',
  );
}
}

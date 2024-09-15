// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';


// import 'bank_account_info.dart';

// class Company {
//   String id;
//   String email;
//   String name;
//   String logoUrl;
//   bool isActive;
//   String bannerUrl;
//   String description;
//   List<String> boardIds;
//   List<String> subscriptionIds;
//   BankAccountInfo bankAccountInfo;
//   Company({
//     required this.id,
//     required this.email,
//     required this.name,
//     required this.logoUrl,
//     required this.isActive,
//     required this.bannerUrl,
//     required this.description,
//     required this.boardIds,
//     required this.subscriptionIds,
//     required this.bankAccountInfo,
//   });

//   Company copyWith({
//     String? id,
//     String? email,
//     String? name,
//     String? logoUrl,
//     bool? isActive,
//     String? bannerUrl,
//     String? description,
//     List<String>? boardIds,
//     List<String>? subscriptionIds,
//     BankAccountInfo? bankAccountInfo,
//   }) {
//     return Company(
//       id: id ?? this.id,
//       email: email ?? this.email,
//       name: name ?? this.name,
//       logoUrl: logoUrl ?? this.logoUrl,
//       isActive: isActive ?? this.isActive,
//       bannerUrl: bannerUrl ?? this.bannerUrl,
//       description: description ?? this.description,
//       boardIds: boardIds ?? this.boardIds,
//       subscriptionIds: subscriptionIds ?? this.subscriptionIds,
//       bankAccountInfo: bankAccountInfo ?? this.bankAccountInfo,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'email': email,
//       'name': name,
//       'logoUrl': logoUrl,
//       'isActive': isActive,
//       'bannerUrl': bannerUrl,
//       'description': description,
//       'boardIds': boardIds,
//       'subscriptionIds': subscriptionIds,
//       'bankAccountInfo': bankAccountInfo.toMap(),
//     };
//   }

//   factory Company.fromMap(Map<String, dynamic> map) {
//     return Company(
//       id: map['id'] as String,
//       email: map['email'] as String,
//       name: map['name'] as String,
//       logoUrl: map['logoUrl'] as String,
//       isActive: map['isActive'] as bool,
//       bannerUrl: map['bannerUrl'] as String,
//       description: map['description'] as String,
//       boardIds: List<String>.from((map['boardIds'] as List<dynamic>)),
//       subscriptionIds:
//           List<String>.from((map['subscriptionIds'] as List<dynamic>)),
//       bankAccountInfo: BankAccountInfo.fromMap(
//           map['bankAccountInfo'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Company.fromJson(String source) =>
//       Company.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Company(id: $id, email: $email, name: $name, logoUrl: $logoUrl, isActive: $isActive, bannerUrl: $bannerUrl, description: $description, boardIds: $boardIds, subscriptionIds: $subscriptionIds, bankAccountInfo: $bankAccountInfo)';
//   }

//   @override
//   bool operator ==(covariant Company other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.email == email &&
//         other.name == name &&
//         other.logoUrl == logoUrl &&
//         other.isActive == isActive &&
//         other.bannerUrl == bannerUrl &&
//         other.description == description &&
//         listEquals(other.boardIds, boardIds) &&
//         listEquals(other.subscriptionIds, subscriptionIds) &&
//         other.bankAccountInfo == bankAccountInfo;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         email.hashCode ^
//         name.hashCode ^
//         logoUrl.hashCode ^
//         isActive.hashCode ^
//         bannerUrl.hashCode ^
//         description.hashCode ^
//         boardIds.hashCode ^
//         subscriptionIds.hashCode ^
//         bankAccountInfo.hashCode;
//   }
// }

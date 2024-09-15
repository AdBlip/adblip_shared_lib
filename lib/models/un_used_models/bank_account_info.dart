// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BankAccountInfo {
  String id;
  String userId;
  String bankName;
  String accountHolderName;
  String accountType; // e.g., Checking, Savings
  String routingNumber; // Often non-sensitive
  String iban; // International Bank Account Number
  String swiftCode; // SWIFT/BIC code for international transfers

  BankAccountInfo({
    required this.id,
    required this.userId,
    required this.bankName,
    required this.accountHolderName,
    required this.accountType,
    required this.routingNumber,
    required this.iban,
    required this.swiftCode,
  });

  BankAccountInfo copyWith({
    String? id,
    String? userId,
    String? bankName,
    String? accountHolderName,
    String? accountType,
    String? routingNumber,
    String? iban,
    String? swiftCode,
  }) {
    return BankAccountInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bankName: bankName ?? this.bankName,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      accountType: accountType ?? this.accountType,
      routingNumber: routingNumber ?? this.routingNumber,
      iban: iban ?? this.iban,
      swiftCode: swiftCode ?? this.swiftCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'bankName': bankName,
      'accountHolderName': accountHolderName,
      'accountType': accountType,
      'routingNumber': routingNumber,
      'iban': iban,
      'swiftCode': swiftCode,
    };
  }

  factory BankAccountInfo.fromMap(Map<String, dynamic> map) {
    return BankAccountInfo(
      id: map['id'] as String,
      userId: map['userId'] as String,
      bankName: map['bankName'] as String,
      accountHolderName: map['accountHolderName'] as String,
      accountType: map['accountType'] as String,
      routingNumber: map['routingNumber'] as String,
      iban: map['iban'] as String,
      swiftCode: map['swiftCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccountInfo.fromJson(String source) =>
      BankAccountInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BankAccountInfo(id: $id, userId: $userId, bankName: $bankName, accountHolderName: $accountHolderName, accountType: $accountType, routingNumber: $routingNumber, iban: $iban, swiftCode: $swiftCode)';
  }

  @override
  bool operator ==(covariant BankAccountInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.bankName == bankName &&
        other.accountHolderName == accountHolderName &&
        other.accountType == accountType &&
        other.routingNumber == routingNumber &&
        other.iban == iban &&
        other.swiftCode == swiftCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        bankName.hashCode ^
        accountHolderName.hashCode ^
        accountType.hashCode ^
        routingNumber.hashCode ^
        iban.hashCode ^
        swiftCode.hashCode;
  }
}

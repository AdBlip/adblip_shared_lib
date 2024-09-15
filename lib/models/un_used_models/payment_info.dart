import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentInfo {
  String id;
  String userId;
  double amount;
  String currency;
  DateTime paymentDate;
  String paymentMethod;
  String billingAddress;
  String billingEmail;
  String transactionId;
  PaymentInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.currency,
    required this.paymentDate,
    required this.paymentMethod,
    required this.billingAddress,
    required this.billingEmail,
    required this.transactionId,
  });

  PaymentInfo copyWith({
    String? id,
    String? userId,
    double? amount,
    String? currency,
    DateTime? paymentDate,
    String? paymentMethod,
    String? billingAddress,
    String? billingEmail,
    String? transactionId,
  }) {
    return PaymentInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      billingAddress: billingAddress ?? this.billingAddress,
      billingEmail: billingEmail ?? this.billingEmail,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'amount': amount,
      'currency': currency,
      'paymentDate': paymentDate.millisecondsSinceEpoch,
      'paymentMethod': paymentMethod,
      'billingAddress': billingAddress,
      'billingEmail': billingEmail,
      'transactionId': transactionId,
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      id: map['id'] as String,
      userId: map['userId'] as String,
      amount: map['amount'] as double,
      currency: map['currency'] as String,
      paymentDate:
          DateTime.fromMillisecondsSinceEpoch(map['paymentDate'] as int),
      paymentMethod: map['paymentMethod'] as String,
      billingAddress: map['billingAddress'] as String,
      billingEmail: map['billingEmail'] as String,
      transactionId: map['transactionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfo.fromJson(String source) =>
      PaymentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentInfo(id: $id, userId: $userId, amount: $amount, currency: $currency, paymentDate: $paymentDate, paymentMethod: $paymentMethod, billingAddress: $billingAddress, billingEmail: $billingEmail, transactionId: $transactionId)';
  }

  @override
  bool operator ==(covariant PaymentInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.amount == amount &&
        other.currency == currency &&
        other.paymentDate == paymentDate &&
        other.paymentMethod == paymentMethod &&
        other.billingAddress == billingAddress &&
        other.billingEmail == billingEmail &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        amount.hashCode ^
        currency.hashCode ^
        paymentDate.hashCode ^
        paymentMethod.hashCode ^
        billingAddress.hashCode ^
        billingEmail.hashCode ^
        transactionId.hashCode;
  }
}

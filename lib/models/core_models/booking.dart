// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper_models/uploaded_file_data.dart';

enum BookingState {
  pending,
  approved,
  rejected,
  canceled;

  String toJson() => switch (this) {
        pending => 'pending',
        approved => 'approved',
        rejected => 'rejected',
        canceled => 'canceled',
      };

  factory BookingState.fromJson(String json) =>
      BookingState.values.firstWhere((e) => e.toJson() == json);
}

class Booking {
  final String id;
  final String boardId;
  final bool isUnAvailablePeriod;
  final String? reasonForUnAvailablePeriod;
  final String boardOwnerId;
  final String clientId;
  final BookingState bookingState;
  final Timestamp startDate;
  final Timestamp endDate;
  final double totalPrice;
  final bool hasPaid;
  final String currency;
  final UploadedFileData adData;

  Booking({
    required this.id,
    required this.boardId,
    this.isUnAvailablePeriod = false,
    this.reasonForUnAvailablePeriod,
    required this.boardOwnerId,
    required this.clientId,
    required this.bookingState,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.hasPaid,
    required this.currency,
    required this.adData,
  });

  Booking copyWith({
    String? id,
    String? boardId,
    bool? isUnAvailablePeriod,
    String? reasonForUnAvailablePeriod,
    String? boardOwnerId,
    String? clientId,
    BookingState? bookingState,
    Timestamp? startDate,
    Timestamp? endDate,
    double? totalPrice,
    bool? hasPaid,
    String? currency,
    UploadedFileData? adData,
  }) {
    return Booking(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      isUnAvailablePeriod: isUnAvailablePeriod ?? this.isUnAvailablePeriod,
      reasonForUnAvailablePeriod:
          reasonForUnAvailablePeriod ?? this.reasonForUnAvailablePeriod,
      boardOwnerId: boardOwnerId ?? this.boardOwnerId,
      clientId: clientId ?? this.clientId,
      bookingState: bookingState ?? this.bookingState,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      hasPaid: hasPaid ?? this.hasPaid,
      currency: currency ?? this.currency,
      adData: adData ?? this.adData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardId': boardId,
      'isUnAvailablePeriod': isUnAvailablePeriod,
      'reasonForUnAvailablePeriod': reasonForUnAvailablePeriod,
      'boardOwnerId': boardOwnerId,
      'clientId': clientId,
      'bookingState': bookingState.toJson(),
      'startDate': startDate,
      'endDate': endDate,
      'totalPrice': totalPrice,
      'hasPaid': hasPaid,
      'currency': currency,
      'adData': adData.toMap(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      boardId: map['boardId'] as String,
      isUnAvailablePeriod: map['isUnAvailablePeriod'] as bool,
      reasonForUnAvailablePeriod: map['reasonForUnAvailablePeriod'] as String?,
      boardOwnerId: map['boardOwnerId'] as String,
      clientId: map['clientId'] as String,
      bookingState: BookingState.fromJson(map['bookingState'] as String),
      startDate: (map['startDate'] as Timestamp),
      endDate: (map['endDate'] as Timestamp),
      totalPrice: map['totalPrice'] as double,
      hasPaid: map['hasPaid'] as bool,
      currency: map['currency'] as String,
      adData: UploadedFileData.fromMap(map['adData'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(id: $id, boardId: $boardId, isUnAvailablePeriod: $isUnAvailablePeriod, reasonForUnAvailablePeriod: $reasonForUnAvailablePeriod, boardOwnerId: $boardOwnerId, clientId: $clientId, bookingState: $bookingState, startDate: $startDate, endDate: $endDate, totalPrice: $totalPrice, hasPaid: $hasPaid, currency: $currency, adData: $adData)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardId == boardId &&
        other.isUnAvailablePeriod == isUnAvailablePeriod &&
        other.reasonForUnAvailablePeriod == reasonForUnAvailablePeriod &&
        other.boardOwnerId == boardOwnerId &&
        other.clientId == clientId &&
        other.bookingState == bookingState &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.totalPrice == totalPrice &&
        other.hasPaid == hasPaid &&
        other.currency == currency &&
        other.adData == adData;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardId.hashCode ^
        isUnAvailablePeriod.hashCode ^
        reasonForUnAvailablePeriod.hashCode ^
        boardOwnerId.hashCode ^
        clientId.hashCode ^
        bookingState.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        totalPrice.hashCode ^
        hasPaid.hashCode ^
        currency.hashCode ^
        adData.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ad.dart';

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
  final bool isAddedByBoardOwner;
  final String boardOwnerId;
  final String clientId;
  final BookingState bookingState;
  final Timestamp startDate;
  final Timestamp endDate;
  final double totalPrice;
  final bool hasPaid;
  final String currency;
  final Ad ad;
  Booking({
    required this.id,
    required this.boardId,
    required this.isAddedByBoardOwner,
    required this.boardOwnerId,
    required this.clientId,
    required this.bookingState,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.hasPaid,
    required this.currency,
    required this.ad,
  });

  Booking copyWith({
    String? id,
    String? boardId,
    bool? isAddedByBoardOwner,
    String? boardOwnerId,
    String? clientId,
    BookingState? bookingState,
    Timestamp? startDate,
    Timestamp? endDate,
    Timestamp? startTime,
    Timestamp? endTime,
    double? totalPrice,
    bool? hasPaid,
    String? currency,
    Ad? ad,
  }) {
    return Booking(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      isAddedByBoardOwner: isAddedByBoardOwner ?? this.isAddedByBoardOwner,
      boardOwnerId: boardOwnerId ?? this.boardOwnerId,
      clientId: clientId ?? this.clientId,
      bookingState: bookingState ?? this.bookingState,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      hasPaid: hasPaid ?? this.hasPaid,
      currency: currency ?? this.currency,
      ad: ad ?? this.ad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardId': boardId,
      'isAddedByBoardOwner': isAddedByBoardOwner,
      'boardOwnerId': boardOwnerId,
      'clientId': clientId,
      'bookingState': bookingState.toJson(),
      'startDate': startDate,
      'endDate': endDate,
      'totalPrice': totalPrice,
      'hasPaid': hasPaid,
      'currency': currency,
      'ad': ad.toMap(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      boardId: map['boardId'] as String,
      isAddedByBoardOwner: map['isAddedByBoardOwner'] as bool,
      boardOwnerId: map['boardOwnerId'] as String,
      clientId: map['clientId'] as String,
      bookingState: BookingState.fromJson(map['bookingState'] as String),
      startDate: (map['startDate'] as Timestamp),
      endDate: (map['endDate'] as Timestamp),
      totalPrice: map['totalPrice'] as double,
      hasPaid: map['hasPaid'] as bool,
      currency: map['currency'] as String,
      ad: Ad.fromMap(map['ad'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(id: $id, boardId: $boardId, isAddedByBoardOwner: $isAddedByBoardOwner, boardOwnerId: $boardOwnerId, clientId: $clientId, bookingState: $bookingState, startDate: $startDate, endDate: $endDate, totalPrice: $totalPrice, hasPaid: $hasPaid, currency: $currency, ad: $ad)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardId == boardId &&
        other.isAddedByBoardOwner == isAddedByBoardOwner &&
        other.boardOwnerId == boardOwnerId &&
        other.clientId == clientId &&
        other.bookingState == bookingState &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.totalPrice == totalPrice &&
        other.hasPaid == hasPaid &&
        other.currency == currency &&
        other.ad == ad;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardId.hashCode ^
        isAddedByBoardOwner.hashCode ^
        boardOwnerId.hashCode ^
        clientId.hashCode ^
        bookingState.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        totalPrice.hashCode ^
        hasPaid.hashCode ^
        currency.hashCode ^
        ad.hashCode;
  }
}

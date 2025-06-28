// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ad.dart';

enum BookingState { pending, approved, rejected, canceled }

class Booking {
  final String id;
  final String boardId;
  final String boardOwnerId;
  final String customerId;
  final BookingState bookingState;
  final Timestamp startDate;
  final Timestamp endDate;
  final double totalPrice;
  final bool hasPaid;
  final String totalCostUnit;
  final Ad ad;
  final String? vendorCompanyId;
  Booking({
    required this.id,
    required this.boardId,
    required this.boardOwnerId,
    required this.customerId,
    required this.bookingState,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.hasPaid,
    required this.totalCostUnit,
    required this.ad,
    this.vendorCompanyId,
  });

  Booking copyWith({
    String? id,
    String? boardId,
    String? boardOwnerId,
    String? customerId,
    BookingState? bookingState,
    Timestamp? startDate,
    Timestamp? endDate,
    Timestamp? startTime,
    Timestamp? endTime,
    double? totalPrice,
    bool? hasPaid,
    String? totalCostUnit,
    Ad? ad,
    String? vendorCompanyId,
  }) {
    return Booking(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      boardOwnerId: boardOwnerId ?? this.boardOwnerId,
      customerId: customerId ?? this.customerId,
      bookingState: bookingState ?? this.bookingState,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      hasPaid: hasPaid ?? this.hasPaid,
      totalCostUnit: totalCostUnit ?? this.totalCostUnit,
      ad: ad ?? this.ad,
      vendorCompanyId: vendorCompanyId ?? this.vendorCompanyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardId': boardId,
      'boardOwnerId': boardOwnerId,
      'customerId': customerId,
      'bookingState': bookingState.index,
      'startDate': startDate,
      'endDate': endDate,
      'totalPrice': totalPrice,
      'hasPaid': hasPaid,
      'totalCostUnit': totalCostUnit,
      'ad': ad.toMap(),
      'vendorCompanyId': vendorCompanyId,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      boardId: map['boardId'] as String,
      boardOwnerId: map['boardOwnerId'] as String,
      customerId: map['customerId'] as String,
      bookingState: BookingState.values[map['bookingState'] as int],
      startDate: (map['startDate'] as Timestamp),
      endDate: (map['endDate'] as Timestamp),
      totalPrice: map['totalPrice'] as double,
      hasPaid: map['hasPaid'] as bool,
      totalCostUnit: map['totalCostUnit'] as String,
      ad: Ad.fromMap(map['ad'] as Map<String, dynamic>),
      vendorCompanyId: map['vendorCompanyId'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(id: $id, boardId: $boardId, boardOwnerId: $boardOwnerId, customerId: $customerId, bookingState: $bookingState, startDate: $startDate, endDate: $endDate, totalPrice: $totalPrice, hasPaid: $hasPaid, totalCostUnit: $totalCostUnit, ad: $ad, vendorCompanyId: $vendorCompanyId)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardId == boardId &&
        other.boardOwnerId == boardOwnerId &&
        other.customerId == customerId &&
        other.bookingState == bookingState &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.totalPrice == totalPrice &&
        other.hasPaid == hasPaid &&
        other.totalCostUnit == totalCostUnit &&
        other.ad == ad &&
        other.vendorCompanyId == vendorCompanyId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardId.hashCode ^
        boardOwnerId.hashCode ^
        customerId.hashCode ^
        bookingState.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        totalPrice.hashCode ^
        hasPaid.hashCode ^
        totalCostUnit.hashCode ^
        ad.hashCode ^
        vendorCompanyId.hashCode;
  }
}

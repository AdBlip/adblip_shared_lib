// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ad.dart';

enum BookingState { pending, approved, rejected, canceled }

class Booking {
  final String id;
  final String boardId;
  final String vendorCompanyId;
  final String customerId;
  final BookingState bookingState;
  final Timestamp startDate;
  final Timestamp endDate;
  final Timestamp startTime;
  final Timestamp endTime;
  final double totalPrice;
  final bool hasPaid;
  final String totalCostUnit;
  final Ad ad;
  Booking({
    required this.id,
    required this.boardId,
    required this.vendorCompanyId,
    required this.customerId,
    required this.bookingState,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.totalPrice,
    required this.hasPaid,
    required this.totalCostUnit,
    required this.ad,
  });

  Booking copyWith({
    String? id,
    String? boardId,
    String? vendorCompanyId,
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
  }) {
    return Booking(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      vendorCompanyId: vendorCompanyId ?? this.vendorCompanyId,
      customerId: customerId ?? this.customerId,
      bookingState: bookingState ?? this.bookingState,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalPrice: totalPrice ?? this.totalPrice,
      hasPaid: hasPaid ?? this.hasPaid,
      totalCostUnit: totalCostUnit ?? this.totalCostUnit,
      ad: ad ?? this.ad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardId': boardId,
      'vendorCompanyId': vendorCompanyId,
      'customerId': customerId,
      'bookingState': bookingState.index,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
      'totalPrice': totalPrice,
      'hasPaid': hasPaid,
      'totalCostUnit': totalCostUnit,
      'ad': ad.toMap(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      boardId: map['boardId'] as String,
      vendorCompanyId: map['vendorCompanyId'] as String,
      customerId: map['customerId'] as String,
      bookingState: BookingState.values[map['bookingState'] as int],
      startDate: (map['startDate'] as Timestamp),
      endDate: (map['endDate'] as Timestamp),
      startTime: (map['startTime'] as Timestamp),
      endTime: (map['endTime'] as Timestamp),
      totalPrice: map['totalPrice'] as double,
      hasPaid: map['hasPaid'] as bool,
      totalCostUnit: map['totalCostUnit'] as String,
      ad: Ad.fromMap(map['ad'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(id: $id, boardId: $boardId, vendorCompanyId: $vendorCompanyId, customerId: $customerId, bookingState: $bookingState, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, totalPrice: $totalPrice, hasPaid: $hasPaid, totalCostUnit: $totalCostUnit, ad: $ad)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardId == boardId &&
        other.vendorCompanyId == vendorCompanyId &&
        other.customerId == customerId &&
        other.bookingState == bookingState &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.totalPrice == totalPrice &&
        other.hasPaid == hasPaid &&
        other.totalCostUnit == totalCostUnit &&
        other.ad == ad;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardId.hashCode ^
        vendorCompanyId.hashCode ^
        customerId.hashCode ^
        bookingState.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        totalPrice.hashCode ^
        hasPaid.hashCode ^
        totalCostUnit.hashCode ^
        ad.hashCode;
  }
}

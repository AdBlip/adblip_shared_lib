// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ad.dart';

enum BoardSubscriptionStatus { pendingApproval, active, complete }

class BoardSubscription {
  final String id;
  final String boardId;
  final String vendorCompanyId;
  final String customerId;
  final BoardSubscriptionStatus boardSubscriptionStatus;
  final Timestamp startDate;
  final Timestamp endDate;
  final Timestamp dailyStartTime;
  final Timestamp dailyEndTime;
  final double totalCost;
  final String totalCostUnit;
  final Ad ad;
  BoardSubscription({
    required this.id,
    required this.boardId,
    required this.vendorCompanyId,
    required this.customerId,
    required this.boardSubscriptionStatus,
    required this.startDate,
    required this.endDate,
    required this.dailyStartTime,
    required this.dailyEndTime,
    required this.totalCost,
    required this.totalCostUnit,
    required this.ad,
  });

  BoardSubscription copyWith({
    String? id,
    String? boardId,
    String? vendorCompanyId,
    String? customerId,
    BoardSubscriptionStatus? boardSubscriptionStatus,
    Timestamp? startDate,
    Timestamp? endDate,
    Timestamp? dailyStartTime,
    Timestamp? dailyEndTime,
    double? totalCost,
    String? totalCostUnit,
    Ad? ad,
  }) {
    return BoardSubscription(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      vendorCompanyId: vendorCompanyId ?? this.vendorCompanyId,
      customerId: customerId ?? this.customerId,
      boardSubscriptionStatus:
          boardSubscriptionStatus ?? this.boardSubscriptionStatus,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      dailyStartTime: dailyStartTime ?? this.dailyStartTime,
      dailyEndTime: dailyEndTime ?? this.dailyEndTime,
      totalCost: totalCost ?? this.totalCost,
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
      'boardSubscriptionStatus': boardSubscriptionStatus.index,
      'startDate': startDate,
      'endDate': endDate,
      'dailyStartTime': dailyStartTime,
      'dailyEndTime': dailyEndTime,
      'totalCost': totalCost,
      'totalCostUnit': totalCostUnit,
      'ad': ad.toMap(),
    };
  }

  factory BoardSubscription.fromMap(Map<String, dynamic> map) {
    return BoardSubscription(
      id: map['id'] as String,
      boardId: map['boardId'] as String,
      vendorCompanyId: map['vendorCompanyId'] as String,
      customerId: map['customerId'] as String,
      boardSubscriptionStatus:
          BoardSubscriptionStatus.values[map['boardSubscriptionStatus']],
      startDate: map['startDate'],
      endDate: map['endDate'],
      dailyStartTime: map['dailyStartTime'],
      dailyEndTime: map['dailyEndTime'],
      totalCost: map['totalCost'] as double,
      totalCostUnit: map['totalCostUnit'] as String,
      ad: Ad.fromMap(map['ad'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardSubscription.fromJson(String source) =>
      BoardSubscription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoardSubscription(id: $id, boardId: $boardId, vendorCompanyId: $vendorCompanyId, customerId: $customerId, boardSubscriptionStatus: $boardSubscriptionStatus, startDate: $startDate, endDate: $endDate, dailyStartTime: $dailyStartTime, dailyEndTime: $dailyEndTime, totalCost: $totalCost, totalCostUnit: $totalCostUnit, ad: $ad)';
  }

  @override
  bool operator ==(covariant BoardSubscription other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardId == boardId &&
        other.vendorCompanyId == vendorCompanyId &&
        other.customerId == customerId &&
        other.boardSubscriptionStatus == boardSubscriptionStatus &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.dailyStartTime == dailyStartTime &&
        other.dailyEndTime == dailyEndTime &&
        other.totalCost == totalCost &&
        other.totalCostUnit == totalCostUnit &&
        other.ad == ad;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardId.hashCode ^
        vendorCompanyId.hashCode ^
        customerId.hashCode ^
        boardSubscriptionStatus.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        dailyStartTime.hashCode ^
        dailyEndTime.hashCode ^
        totalCost.hashCode ^
        totalCostUnit.hashCode ^
        ad.hashCode;
  }
}

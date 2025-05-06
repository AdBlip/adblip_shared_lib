import 'package:cloud_firestore/cloud_firestore.dart';

class BookedTimeSpan {
  final Timestamp startDate;
  final Timestamp endDate;

  BookedTimeSpan({
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory BookedTimeSpan.fromMap(Map<String, dynamic> map) {
    return BookedTimeSpan(
      startDate: map['startDate'] is Timestamp
          ? map['startDate'] as Timestamp
          : Timestamp.fromDate(DateTime.parse(map['startDate'] as String)),
      endDate: map['endDate'] is Timestamp
          ? map['endDate'] as Timestamp
          : Timestamp.fromDate(DateTime.parse(map['endDate'] as String)),
    );
  }
}
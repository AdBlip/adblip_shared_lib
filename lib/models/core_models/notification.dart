// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String id; 
  final String title; 
  final String body; 
  final String imageUrl; // Associated booking ID (if applicable)
  final Timestamp creationTime; // When the notification was created
  final bool isRead; // Flag to indicate if the notification has been read
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.creationTime,
    required this.isRead,
  });

  Notification copyWith({
    String? id,
    String? title,
    String? body,
    String? imageUrl,
    Timestamp? creationTime,
    bool? isRead,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      creationTime: creationTime ?? this.creationTime,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
      'creationTime': creationTime,
      'isRead': isRead,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      imageUrl: map['imageUrl'] as String,
      creationTime: map['creationTime'] as Timestamp,
      isRead: map['isRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, imageUrl: $imageUrl, creationTime: $creationTime, isRead: $isRead)';
  }

  @override
  bool operator ==(covariant Notification other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.body == body &&
      other.imageUrl == imageUrl &&
      other.creationTime == creationTime &&
      other.isRead == isRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      body.hashCode ^
      imageUrl.hashCode ^
      creationTime.hashCode ^
      isRead.hashCode;
  }
}
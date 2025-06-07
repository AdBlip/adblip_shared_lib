class BillboardFeedback {
  final String id;
  final String userId;
  final String userName;
  final String userProfileImageUrl;
  final double rating;
  final String billboardId;
  final DateTime createdAt;
  final String? comment;

  BillboardFeedback({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userProfileImageUrl,
    required this.rating,
    required this.billboardId,
    required this.createdAt,
    required this.comment,
  });

  factory BillboardFeedback.fromJson(Map<String, dynamic> json) {
    return BillboardFeedback(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userProfileImageUrl: json['userProfileImagePath'],
      rating: json['rating'],
      billboardId: json['billboardId'],
      createdAt: DateTime.parse(json['createdAt']),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userProfileImagePath': userProfileImageUrl,
      'rating': rating,
      'billboardId': billboardId,
      'createdAt': createdAt.toIso8601String(),
      'comment': comment,
    };
  }
}

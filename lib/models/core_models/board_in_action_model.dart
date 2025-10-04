class BoardInActionModel {
  final String id;
  final String mediaUrl;
  final String boardId;
  
  // final String title;

  BoardInActionModel({
    required this.id,
    required this.mediaUrl,
    required this.boardId,
  });
  factory BoardInActionModel.fromJson(Map<String, dynamic> json) {
    return BoardInActionModel(
      id: json['id'],
      boardId: json['boardId'],
      mediaUrl: json['mediaUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'boardId': boardId,
        'mediaUrl': mediaUrl,
      };

  @override
  String toString() {
    return 'BoardInActionModel{id: $id, boardId: $boardId, mediaUrl: $mediaUrl}';
  }

  BoardInActionModel copyWith({
    String? id,
    String? boardId,
    String? mediaUrl,
  }) {
    return BoardInActionModel(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }
}

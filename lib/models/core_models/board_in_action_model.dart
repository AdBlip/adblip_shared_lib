class BoardInActionModel {
  final String id;
  final String boardId;
  final String mediaUrl;
  final bool isVideo;
  // final String title;

  BoardInActionModel({
    required this.id,
    required this.boardId,
    required this.mediaUrl,
    required this.isVideo,
  });

  BoardInActionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        boardId = json['boardId'],
        mediaUrl = json['mediaUrl'],
        isVideo = json['isVideo'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'boardId': boardId,
        'mediaUrl': mediaUrl,
        'isVideo': isVideo,
      };

  @override
  String toString() {
    return 'BoardInActionModel{id: $id, boardId: $boardId, mediaUrl: $mediaUrl, isVideo: $isVideo}';
  }

  BoardInActionModel copyWith({
    String? id,
    String? boardId,
    String? mediaUrl,
    bool? isVideo,
    String? title,
  }) {
    return BoardInActionModel(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isVideo: isVideo ?? this.isVideo,
    );
  }
}

class ImageData {
  final String path;
  final String url;
  ImageData({
    required this.path,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'url': url,
    };
  }

  ImageData copyWith({
    String? path,
    String? url,
  }) {
    return ImageData(
      path: path ?? this.path,
      url: url ?? this.url,
    );
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      path: map['path'] as String,
      url: map['url'] as String,
    );
  }
}

class UploadedFileData {
  final String path;
  final String url;
  UploadedFileData({
    required this.path,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'url': url,
    };
  }

  factory UploadedFileData.fromMap(Map<String, dynamic> map) {
    return UploadedFileData(
      path: map['path'] as String,
      url: map['url'] as String,
    );
  }
}

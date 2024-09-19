enum UploadedFileType{
  image,
  video,
  document
}
class UploadedFileData {
  final String path;
  final String url;
  final UploadedFileType type;
  UploadedFileData({
    required this.path,
    required this.url,
    required this.type
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'url': url,
      'type':type.index
    };
  }



  factory UploadedFileData.fromMap(Map<String, dynamic> map) {
    return UploadedFileData(
      path: map['path'] as String,
      url: map['url'] as String,
      type:UploadedFileType.values[map['type']]
    );
  }
}

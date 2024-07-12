import 'dart:convert';

class PhotosModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotosModel.fromRawJson(String str) => PhotosModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}

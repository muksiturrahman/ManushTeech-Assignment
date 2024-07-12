import 'dart:convert';

class AlbumsModel {
  int userId;
  int id;
  String title;

  AlbumsModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumsModel.fromRawJson(String str) => AlbumsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}

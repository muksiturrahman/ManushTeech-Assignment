import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manushtech_assignment/models/albums_model.dart';
import 'package:manushtech_assignment/models/photos_model.dart';

import 'app_services.dart';
import 'base_client.dart';

Future<dynamic> initAlbumsListInfo(BuildContext context) async {
  String url = AppServices.albumsUrl;

  try {
    var response = await BaseClient().getMethodWithoutHeader(url);

    if (response != null) {
      var jsonResponse = json.decode(response);
      if (jsonResponse is List) {
        List<AlbumsModel> albumsList = jsonResponse.map<AlbumsModel>((album) => AlbumsModel.fromJson(album)).toList();
        return albumsList;
      } else if (jsonResponse is Map<String, dynamic>) {
        AlbumsModel album = AlbumsModel.fromJson(jsonResponse);
        return [album]; // Wrap in a list to maintain consistency
      } else {
        throw Exception("Unexpected JSON format");
      }
    } else {
      throw Exception("Response is null");
    }
  } catch (e) {
    print("Error: $e");
    return Future.error("Failed to load album info");
  }
}

Future<dynamic> initPhotosListInfo(BuildContext context) async {
  String url = AppServices.photosUrl;

  try {
    var response = await BaseClient().getMethodWithoutHeader(url);

    if (response != null) {
      var jsonResponse = json.decode(response);
      if (jsonResponse is List) {
        List<PhotosModel> photosList = jsonResponse.map<PhotosModel>((photos) => PhotosModel.fromJson(photos)).toList();
        return photosList;
      } else if (jsonResponse is Map<String, dynamic>) {
        PhotosModel photos = PhotosModel.fromJson(jsonResponse);
        return [photos]; // Wrap in a list to maintain consistency
      } else {
        throw Exception("Unexpected JSON format");
      }
    } else {
      throw Exception("Response is null");
    }
  } catch (e) {
    print("Error: $e");
    return Future.error("Failed to load Photos info");
  }
}

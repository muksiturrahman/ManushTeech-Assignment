import 'package:flutter/material.dart';
import 'package:manushtech_assignment/models/albums_model.dart';
import 'package:manushtech_assignment/network/presenter.dart';

class AlbumsProvider with ChangeNotifier {
  List<AlbumsModel> _albumsList = [];
  List<AlbumsModel> _filteredAlbumsList = [];
  bool _isLoading = false;

  List<AlbumsModel> get albumsList => _filteredAlbumsList;
  bool get isLoading => _isLoading;

  Future<void> fetchAlbums(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      var albumsListInfo = await initAlbumsListInfo(context);
      if (albumsListInfo is List<AlbumsModel>) {
        _albumsList = albumsListInfo;
        _filteredAlbumsList = _albumsList;
      } else {
        // Handle error case
        print(albumsListInfo);
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchAlbums(String query) {
    if (query.isEmpty) {
      _filteredAlbumsList = _albumsList;
    } else {
      _filteredAlbumsList = _albumsList
          .where((album) => album.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

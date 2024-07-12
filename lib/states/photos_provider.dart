import 'package:flutter/material.dart';
import 'package:manushtech_assignment/network/presenter.dart';

import '../models/photos_model.dart';

class PhotosProvider with ChangeNotifier {
  List<PhotosModel> _photosList = [];
  bool _isLoading = false;

  List<PhotosModel> get photosList => _photosList;
  bool get isLoading => _isLoading;

  Future<void> fetchPhotos(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      var photosListInfo = await initPhotosListInfo(context);
      if (photosListInfo is List<PhotosModel>) {
        _photosList = photosListInfo;
      } else {
        // Handle error case
        print(photosListInfo);
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

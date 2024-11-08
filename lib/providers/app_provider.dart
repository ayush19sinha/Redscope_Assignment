import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AppProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<dynamic> _repos = [];
  List<dynamic> _images = [];
  final List<String> _bookmarkedImages = [];

  List<dynamic> get repos => _repos;
  List<dynamic> get images => _images;
  List<String> get bookmarkedImages => _bookmarkedImages;

  Future<void> fetchRepos() async {
    _repos = await _apiService.getPublicGists();
    notifyListeners();
  }

  Future<void> fetchImages() async {
    _images = await _apiService.getUnsplashImages();
    notifyListeners();
  }

  void toggleBookmark(String imageId) {
    if (_bookmarkedImages.contains(imageId)) {
      _bookmarkedImages.remove(imageId);
    } else {
      _bookmarkedImages.add(imageId);
    }
    notifyListeners();
  }
}
import 'package:flutter/foundation.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repositories/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  final repository = NewsRepository();
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

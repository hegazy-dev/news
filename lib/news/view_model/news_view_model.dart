import 'package:flutter/foundation.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.newsList != null) {
        newsList = response.newsList!;
      } else {
        errorMessage = 'Failed to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

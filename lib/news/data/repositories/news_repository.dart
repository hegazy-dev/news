import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsRepository {
  final newsDataSource;

  const NewsRepository(this.newsDataSource);

  Future<List<News>> getNews(String sourceId) {
    return newsDataSource.getNews(sourceId);
  }
}

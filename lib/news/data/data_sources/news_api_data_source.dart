import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/constants/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsApiDataSource implements NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.newsList != null) {
      return newsResponse.newsList!;
    } else {
      throw Exception('Failed to get news');
    }
  }
}

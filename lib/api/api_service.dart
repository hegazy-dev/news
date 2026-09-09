import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_responce/sources_responce.dart';

class ApiService {
  static Future<SourcesResponce> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourcesEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponce.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}

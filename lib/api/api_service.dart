import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/sources_responce/sources_responce.dart';

class ApiService {
  static Future<SourcesResponce> getSources(String categoryId) async {
    final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
      'apiKey': '57bdf735bef84e3bbb46ecdfa5c63aef',
      'category': categoryId,
    });
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponce.fromJson(json);
  }
}

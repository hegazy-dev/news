import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/sources/data/models/source.dart';
import 'package:news/shared/constants/api_constants.dart';
import 'package:news/sources/data/models/sources_responce.dart';

class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourcesEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponce.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources');
    }
  }
}

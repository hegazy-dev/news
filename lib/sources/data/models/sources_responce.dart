import 'source.dart';

class SourcesResponce {
  String? status;
  List<Source>? sources;

  SourcesResponce({this.status, this.sources});

  factory SourcesResponce.fromJson(Map<String, dynamic> json) {
    return SourcesResponce(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

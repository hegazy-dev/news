import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  const SourcesRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) {
    return dataSource.getSources(categoryId);
  }
}

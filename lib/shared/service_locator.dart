import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';
import 'package:news/sources/view_model/sources_view_model.dart';

class ServiceLocator {
  //Sources
  static SourcesDataSource sourcesDataSource = SourcesApiDataSource();
  static SourcesRepository sourcesRepository = SourcesRepository(
    sourcesDataSource,
  );
  static SourcesViewModel sourcesViewModel = SourcesViewModel(
    sourcesRepository,
  );

  //News
  static NewsDataSource newsDataSource = NewsApiDataSource();
  static NewsRepository newsRepository = NewsRepository(newsDataSource);
  static NewsViewModel newsViewModel = NewsViewModel(newsRepository);
}

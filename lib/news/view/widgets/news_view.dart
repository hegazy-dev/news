import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/shared/theme/app_theme.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({required this.categoryId});

  final String categoryId;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  final sourcesViewModel = ServiceLocator.sourcesViewModel;
  final newsViewModel = ServiceLocator.newsViewModel;

  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            final sources = viewModel.sources;
            newsViewModel.getNews(sources[currentIndex].id!);

            return Column(
              children: [
                DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: AppTheme.white,
                    tabAlignment: .start,
                    labelPadding: EdgeInsetsDirectional.only(end: 16),
                    padding: EdgeInsetsDirectional.only(start: 16),
                    onTap: (index) {
                      if (currentIndex == index) return;
                      currentIndex = index;
                      setState(() {});
                    },
                    tabs: sources
                        .map(
                          (source) => TabItem(
                            source: source,
                            isSelected: currentIndex == sources.indexOf(source),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: ChangeNotifierProvider(
                    create: (_) => newsViewModel,
                    child: Consumer<NewsViewModel>(
                      builder: (_, viewModel, _) {
                        if (viewModel.isLoading) {
                          return const LoadingIndicator();
                        } else if (viewModel.errorMessage != null) {
                          return ErrorIndicator(viewModel.errorMessage!);
                        } else {
                          final newsList = viewModel.newsList;

                          return ListView.separated(
                            padding: EdgeInsets.only(top: 16),
                            itemBuilder: (_, index) =>
                                NewsItem(news: newsList[index]),
                            separatorBuilder: (_, _) => SizedBox(height: 16),
                            itemCount: newsList.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

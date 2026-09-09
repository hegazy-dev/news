import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsView extends StatefulWidget {
  const NewsView({required this.categoryId});

  final String categoryId;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  late final getSourcesFuture = ApiService.getSources(widget.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];

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
                child: FutureBuilder(
                  future: ApiService.getNews(sources[currentIndex].id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == .waiting) {
                      return const LoadingIndicator();
                    } else if (snapshot.hasError ||
                        snapshot.data?.status != 'ok') {
                      return const ErrorIndicator();
                    } else {
                      final newsList = snapshot.data?.newsList ?? [];

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
            ],
          );
        }
      },
    );
  }
}

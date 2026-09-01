import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';

class NewsView extends StatefulWidget {
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: SourcesModel.sources.length,
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
            tabs: SourcesModel.sources
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected:
                        currentIndex == SourcesModel.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 16),
            itemBuilder: (_, index) => NewsItem(),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

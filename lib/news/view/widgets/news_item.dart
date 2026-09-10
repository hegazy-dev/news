import 'package:flutter/material.dart';
import 'package:news/shared/theme/app_theme.dart';
import 'package:news/news/data/models/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.network(
            news.urlToImage ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVwgogIs5TX3kRQYYgjscZbwxj4Gi0ranWzBAePxAyI3QP9U8bdRsHiPLl&s=10',
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: double.infinity,
            fit: .fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(news.title ?? '', style: textTheme.titleSmall),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'By : ${news.source?.name ?? ''}',
                style: textTheme.labelMedium,
              ),
              Text(
                timeago.format(news.publishedAt!),
                style: textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

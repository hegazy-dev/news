import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    DateTime fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/news_image.png',
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: double.infinity,
            fit: .fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '40-year-old man falls 200 feet to his death while canyoneering at national park',
              style: textTheme.titleSmall,
            ),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('By : Jon Haworth', style: textTheme.labelMedium),
              Text(timeago.format(fifteenAgo), style: textTheme.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}

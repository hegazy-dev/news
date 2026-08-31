import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Good Morning\nHere is Some News For You',
              style: TextTheme.of(
                context,
              ).titleLarge?.copyWith(color: AppTheme.white, fontWeight: .w500),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => CategoryItem(
                index: index,
                category: CategoryModel.categories[index],
              ),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

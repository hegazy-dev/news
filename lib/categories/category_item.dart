import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  int index;
  CategoryModel category;

  CategoryItem({required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      clipBehavior: .antiAlias,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
            height: double.infinity,
            width: double.infinity,
            fit: .fill,
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 50,
            end: index.isEven ? 50 : null,
            start: index.isOdd ? 50 : null,
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}

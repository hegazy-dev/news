import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  VoidCallback onGoToHomeClicked;

  HomeDrawer({required this.onGoToHomeClicked});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      width: screenSize.width * 0.7,
      color: AppTheme.black,
      child: Column(
        children: [
          Container(
            color: AppTheme.white,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: .center,
            child: Text('News App', style: textTheme.titleLarge),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onGoToHomeClicked();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/home.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 8),
                      Text('Go To Home', style: textTheme.titleMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

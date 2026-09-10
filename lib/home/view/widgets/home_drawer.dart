import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/app_theme.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  VoidCallback onGoToHomeClicked;

  HomeDrawer({required this.onGoToHomeClicked});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedLanguage = 'English';

  Widget buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),

      dropdownColor: AppTheme.black,

      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),

      style: Theme.of(context).textTheme.titleMedium,

      items: items.map((item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),

      onChanged: onChanged,
    );
  }

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
                    widget.onGoToHomeClicked();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/home.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      const SizedBox(width: 8),
                      Text('Go To Home', style: textTheme.titleMedium),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Divider(),
                const SizedBox(height: 24),

                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/theme.svg',
                      height: 24,
                      width: 24,
                      fit: .scaleDown,
                    ),
                    const SizedBox(width: 8),
                    Text('Theme', style: textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Consumer<SettingsProvider>(
                  builder: (context, settingsProvider, child) {
                    return buildDropdown(
                      value: settingsProvider.themeMode == ThemeMode.dark
                          ? 'Dark'
                          : 'Light',
                      items: const ['Dark', 'Light'],
                      onChanged: (value) {
                        if (value == null) return;

                        settingsProvider.changeTheme(
                          value == 'Dark' ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),
                Divider(),
                const SizedBox(height: 24),

                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/language.svg',
                      height: 24,
                      width: 24,
                      fit: .scaleDown,
                    ),
                    const SizedBox(width: 8),
                    Text('Language', style: textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Consumer<SettingsProvider>(
                  builder: (context, settingsProvider, child) {
                    return buildDropdown(
                      value: settingsProvider.languageCode == 'en'
                          ? 'English'
                          : 'Arabic',
                      items: const ['English', 'Arabic'],
                      onChanged: (value) {
                        if (value == null) return;

                        settingsProvider.changeLanguge(
                          value == 'English' ? 'en' : 'ar',
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

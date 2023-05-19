import 'package:flutter/material.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';

class PagesButton extends StatelessWidget {
  const PagesButton({
    super.key,
    required this.themeData,
    required this.mediaQueryData,
    required this.homeProvider,
    required this.onTap,
    required this.title,
    this.isCurrentPage = false,
  });

  final String title;
  final HomeProvider homeProvider;
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;
  final VoidCallback onTap;
  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: mediaQueryData.size.height * 0.050,
        width: mediaQueryData.size.width * 0.1,
        decoration: BoxDecoration(
          color: themeData.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: themeData.textTheme.bodyMedium!.copyWith(
              fontSize: 20,
              color: isCurrentPage == true
                  ? themeData.scaffoldBackgroundColor
                  : const Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}

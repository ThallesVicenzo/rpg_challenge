import 'package:flutter/material.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';
import 'package:rpg_challenge/view_model/providers/pages_provider.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
    required this.pagesProvider,
    required this.themeData,
    required this.mediaQueryData,
    required this.homeProvider,
    required this.onTap,
  });

  final PagesProvider pagesProvider;
  final HomeProvider homeProvider;
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: themeData.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Ver mais',
            style: themeData.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rpg_challenge/shared/constants.dart';

class Apptheme {
  static get appTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xff861E2B),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black.withOpacity(0.8),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF9E9E9E),
        ),
        primaryColor: const Color(0xFF9E9E9E),
        iconTheme: const IconThemeData(
          color: Color(0xFF9E9E9E),
          size: 25,
        ),
        cardColor: const Color(0xFF000000).withOpacity(0.7),
        inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF9E9E9E),
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff861E2B),
                width: 4,
              ),
            )),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: kDefaultFontFamily,
            fontSize: 30,
            color: Color(0xFF9E9E9E),
            decoration: TextDecoration.underline,
          ),
          bodyLarge: TextStyle(
            fontFamily: kDefaultFontFamily,
            fontSize: 45,
            color: Color(0xFF9E9E9E),
          ),
          bodyMedium: TextStyle(
            fontFamily: kDefaultFontFamily,
            fontSize: 25,
            color: Color(0xFF000000),
          ),
          bodySmall: TextStyle(
            fontFamily: kDefaultFontFamily,
            fontSize: 17,
            color: Color(0xFF9E9E9E),
          ),
        ),
      );
}

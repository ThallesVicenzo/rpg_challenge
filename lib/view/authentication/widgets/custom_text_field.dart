import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.theme,
    required this.hintText,
    this.hideText = false,
    this.sufixIcon,
    this.errorText,
  });

  final String title;
  final TextEditingController? controller;
  final String? errorText;
  final String hintText;
  final IconButton? sufixIcon;
  final ThemeData theme;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TextField(
        controller: controller,
        style: theme.textTheme.bodySmall,
        obscureText: hideText,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: theme.textTheme.bodySmall,
          hintText: hintText,
          hintStyle: theme.textTheme.bodySmall,
          suffixIcon: sufixIcon,
          errorText: errorText,
          errorStyle: theme.textTheme.bodySmall!.copyWith(
            color: theme.primaryColor,
          ),
          border: theme.inputDecorationTheme.border,
          focusedBorder: theme.inputDecorationTheme.focusedBorder,
        ),
      ),
    );
  }
}
